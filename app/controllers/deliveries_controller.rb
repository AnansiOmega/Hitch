class DeliveriesController < ApplicationController
    before_action :authorized_broker, :authorized_driver
    before_action :find_delivery, only: [:show, :destroy, :pickup, :dropoff]

    def index
        @deliveries = Delivery.all
    end

    def show
    end

    def new
        @delivery = Delivery.new
    end

    def create
        delivery = Delivery.create(delivery_params)
        redirect_to broker_path(delivery.broker.id)
    end

    def destroy 
        @delivery.destroy
        redirect_back fallback_location: brokers_path
    end

    def pickup
        @delivery.pickup
        redirect_to delivery_path(@delivery)
    end

    def dropoff
        @delivery.dropoff
        redirect_to delivery_path(@delivery)
    end

    private

    def find_delivery
        @delivery = Delivery.find(params[:id])
    end

    def delivery_params
        params.require(:delivery).permit(:broker_id, :supplier_id, :receiver_id, :driver_id, :height, :weight, :hazardous, :scheduled_pickup, :description, :status)
    end

end
