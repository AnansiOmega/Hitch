class SessionsController < ApplicationController
    before_action :authorized_broker
    skip_before_action :authorized_broker, only: [:broker_logout, :broker_logging,:home,:broker_login]
    





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

end
