class DriversController < ApplicationController

    before_action :authorized_broker
    skip_before_action :authorized_broker


    def index
        @drivers = Driver.all
    end
    
    def show
        @driver = Driver.find(params[:id])
    end
    
    def new
        @driver = Driver.new
    end

    def create
        driver = Driver.create(driver_params)

        redirect_to driver_path(driver)
    end

    private

    def driver_params
        params.require(:driver).permit(:name, :email, :password)
    end
end