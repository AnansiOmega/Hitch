class ApplicationController < ActionController::Base
    # before_action :authorized_broker, :authorized_driver
    # if :authorized_broker
    #     skip_before_action :authorized_driver
    # end
    
    # if :authorized_driver
    #     skip_before_action :authorized_broker
    # end
    
    def logged_in_broker
        @logged_in_broker = Broker.find_by(id: session[:broker_id])
    end
    
    # def authorized_broker
    #     redirect_back fallback_location: home_path && flash[:not_logged] = "Only Brokers Please" unless logged_in_broker
    # end
    
    def logged_in_driver
        @logged_in_driver = Driver.find_by(id: session[:driver_id])
    end
    
    # def authorized_driver
    #     redirect_back fallback_location: home_path && flash[:not_logged] = "Only Drivers Please" unless logged_in_driver
    # end
end
