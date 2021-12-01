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
        zendesk_message = " Company name : #{@intervention.customer.company_name} \n Building : ##{@intervention.building.id} \n Battery : ##{@intervention.battery.id} \n"
        if !@intervention.column.nil?
            zendesk_message = zendesk_message + " Column : ##{@intervention.column.id} \n"
            if !@intervention.elevator.nil?
                zendesk_message = zendesk_message + " Elevator : ##{@intervention.elevator.id} \n"
            end
        end
        if @intervention.employee
            zendesk_message = zendesk_message + "\n Employee : #{@intervention.employee.first_name}"
        end
        zendesk_message = zendesk_message + "\n Report description : \n #{@intervention.report}"
        ZendeskAPI::Ticket.create!($client, :type=> ["Problem", "Question"].sample, :subject => @intervention.customer.company_name, :requester => { :name => "RockeTeam", :email => "rocketeam1234@gmail.com" }, :comment => { :body => "Intervention for : \n #{zendesk_message}" }, :priority => "urgent")
        # ZendeskAPI::Ticket.create!($client, :type=> ["Problem", "Question"].sample, :subject => @intervention.customer.company_name, :requester => { :name => "David Amyot", :email => "david.amyot@codeboxx.biz" }, :comment => { :body => "Intervention for : \n #{zendesk_message}" }, :priority => "urgent")
        @intervention.save
        redirect_to interventions_path
    end

    private
    def intervention_params
      params.require(:intervention).permit(:author, :start_date, :end_date, :report, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id)
    end
  
end
