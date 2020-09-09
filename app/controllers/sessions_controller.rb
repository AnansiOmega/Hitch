class SessionsController < ApplicationController
    # before_action :authorized_broker, :authorized_driver, :logged_in_driver, :logged_in_broker
    # skip_before_action :authorized_broker, only: [:broker_logout, :broker_logging, :home, :broker_login, :driver_login, :driver_logging, :driver_logout]
    # skip_before_action :authorized_driver, only: [:broker_logout, :broker_logging, :home, :broker_login, :driver_login, :driver_logging, :driver_logout]
    
    def broker_logout
        session.delete(:broker_id)
        redirect_to home_path
    end

    def broker_logging
        broker = Broker.find_by(name: params[:broker][:name])
        if broker.nil?
            flash[:error] = "Username or Password is incorrect"
            redirect_to broker_login_path
        elsif broker.authenticate(params[:broker][:password])
            session[:broker_id] = broker.id
            redirect_to broker_path(broker)
        else
            flash[:error] = "Username or Password is incorrect"
            redirect_to broker_login_path
        end
    end

    def driver_logout
        session.delete(:driver_id)
        redirect_to home_path
    end

    def driver_logging
        driver = Driver.find_by(name: params[:driver][:name])
        if driver.nil?
            flash[:error] = "Username or Password is incorrect"
            redirect_to driver_login_path
        elsif driver.authenticate(params[:driver][:password])
            session[:driver_id] = driver.id
            redirect_to driver_path(driver)
        else
            flash[:error] = "Username or Password is incorrect"
            redirect_to driver_login_path
        end
    end

end
