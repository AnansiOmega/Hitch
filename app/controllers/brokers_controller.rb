class BrokersController < ApplicationController

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

        redirect_to broker_path(broker)
    end


    private


    def broker_params
        params.require(:broker).permit(:name,:email, :password)
    end


end
