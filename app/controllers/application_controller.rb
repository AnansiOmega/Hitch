class ApplicationController < ActionController::Base
    before_action :authorized_broker
    skip_before_action :authorized_broker, only: [:logged_in_broker]

    def logged_in_broker
        @logged_in_broker = Broker.find_by(id: session[:broker_id])
    end

    def authorized_broker
        redirect_back fallback_location: home_path && flash[:not_logged] = "Please sign in to view this information" unless logged_in_broker
    end


end
