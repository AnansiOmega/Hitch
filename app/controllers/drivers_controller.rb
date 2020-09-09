class DriversController < ApplicationController
    before_action :authorized_driver, :logged_in_driver
    skip_before_action :authorized_driver, only: [:index, :new, :create, :show]

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
        if driver.valid?
            session[:driver_id] = driver.id
        redirect_to driver_path(driver)
        else 
            flash[:error] = driver.errors.full_messages
            redirect_to new_driver_path
        end
    end

    private

    def driver_params
        params.require(:driver).permit(:name, :email, :password)
    end
end