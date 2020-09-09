class BrokersController < ApplicationController
    before_action :authorized_broker, :authorized_driver, :logged_in_driver
    skip_before_action :authorized_broker, only: [:index,:new,:create]
    skip_before_action :authorized_driver, only: [:index,:new,:create]
    
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

    private

    def broker_params
        params.require(:broker).permit(:name,:email, :password)
    end
end