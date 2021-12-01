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
        zendesk_message = "#{@intervention.customer} \n #{@intervention.building} \n #{@intervention.battery}"
        if @intervention.column
            zendesk_message = zendesk_message + "\n #{@intervention.column}"
            if @intervention.elevator
                zendesk_message = zendesk_message + "\n #{@intervention.elevator}"
            end
        end
        if @intervention.employee
            zendesk_message = zendesk_message + "\n #{@intervention.employee.first_name}"
        end
        zendesk_message = zendesk_message + "\n #{@intervention.report}"
        ZendeskAPI::Ticket.create!($client, :subject => current_user.email, :requester => { :name => current_user.email, :email => current_user.email }, :comment => { :body => "#{zendesk_message}" }, :priority => "urgent")
      
    end

    private
    def intervention_params
      params.require(:intervention).permit(:author, :start_date, :end_date, :report, :customer, :building, :battery, :column, :elevator, :employee)
    end
  
end
