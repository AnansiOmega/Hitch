class DeliveriesController < ApplicationController
    before_action :authorized_broker, :authorized_driver
    before_action :find_delivery, only: [:show, :destroy, :pickup, :dropoff, :transit, :dropped_off]
    skip_before_action :authorized_driver, except: [:pickup, :dropoff]
    skip_before_action :authorized_broker


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
        if delivery.valid?
        redirect_to broker_path(delivery.broker_id)
        else
            flash[:errors] = delivery.errors.full_messages
            redirect_to new_delivery_path
        end
    end

    def destroy 
        @delivery.destroy
        redirect_to broker_path(session[:broker_id])
    end

    def pickup
        @delivery.pickup
        redirect_to delivery_transit_path(@delivery)
    end

    def dropoff
        @delivery.dropoff
        redirect_to delivery_dropped_off_path(@delivery)
    end

    def transit
        @driver = @delivery.driver
    end

    def dropped_off
        @driver = @delivery.driver
    end

    private

    def find_delivery
        @delivery = Delivery.find(params[:id])
    end

    def delivery_params
        params.require(:delivery).permit(:supplier_id, :receiver_id, :driver_id, :height, :weight, :hazardous, :scheduled_pickup, :description, :status, :broker_id)
    end

end
