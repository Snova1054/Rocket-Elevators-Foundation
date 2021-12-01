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
        @intervention = Intervention.new
    end
    def create
        @intervention = Intervention.create(intervention_params)
    end

    private
    def intervention_params
      params.require(:intervention).permit(:author, :start_date, :end_date, :report, :customer, :building, :battery, :column, :elevator)
    end
  
end
