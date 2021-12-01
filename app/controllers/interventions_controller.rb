require 'zendesk_main'

class InterventionsController < ApplicationController
    before_action :authenticate_user!, :only => [:index]
    def new
        @intervention = Intervention.new
    end
    def index
        @customers = Customer.all
        @buildings = Building.all
        @batteries = Battery.all
        @columns = Column.all
        @elevators = Elevator.all
        @employees = Employee.all
        @intervention = Intervention.new
    end
    def create
        @intervention = Intervention.new(intervention_params)
        current_employee = Employee.find(current_user.id)
        @intervention.author = "#{current_employee.last_name} #{current_employee.first_name}"
        zendesk_message = "#{@intervention.customer} #{@intervention.building} #{@intervention.battery}"
        if @intervention.column
            zendesk_message = zendesk_message + " #{@intervention.column}"
            if @intervention.elevator
                zendesk_message = zendesk_message + "\n #{@intervention.elevator}"
            end
        end
        if @intervention.employee
            zendesk_message = zendesk_message + "\n #{@intervention.employee.first_name}"
        end
        zendesk_message = zendesk_message + "\n #{@intervention.report}"
        ZendeskAPI::Ticket.create!($client, :type=> ["Problem", "Question"].sample, :subject => "message", :requester => { :name => "RockeTeam", :email => "rocketeam1234@gmail.com" }, :comment => { :body => "Hello problem here #{@intervention.report}" }, :priority => "urgent")
        @intervention.save
        redirect_to interventions_path
    end
    # apparently it's only :type => "Question"
    # or to be more precise, type: "Question"

    private
    def intervention_params
      params.require(:intervention).permit(:author, :start_date, :end_date, :report, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id)
    end
  
end
