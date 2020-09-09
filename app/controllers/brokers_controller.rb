class BrokersController < ApplicationController
    before_action :authorized_broker, :logged_in_broker
    skip_before_action :authorized_broker, only: [:new,:create,:index,:show]
   
    
    def index
        @brokers = Broker.all
    end

    def show
        @broker = Broker.find(params[:id])
    end

    def new
        @broker = Broker.new
    end

    def create
        broker = Broker.create(broker_params)
        if broker.valid?
            session[:broker_id] = broker.id
            redirect_to broker_path(broker)
        else
            flash[:errors] = broker.errors.full_messages
            redirect_to new_broker_path
        end
    end

    def transit
        @broker = Broker.find_by(id: session[:broker_id])
    end

    def dropped_off
        @broker = Broker.find_by(id: session[:broker_id])
    end

    private

    def broker_params
        params.require(:broker).permit(:name,:email, :password)
    end
end