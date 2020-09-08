class DeliveriesController < ApplicationController










    def new
        @delivery = Delivery.new
    end

    def create
        delivery = Delivery.create(delivery_params)
        redirect_to broker_path(delivery.broker.id)
    end

    def destroy 
        delivery = Delivery.find(params[:id])
        delivery.destroy
        redirect_back fallback_location: brokers_path
    end



    private

    def delivery_params
        params.require(:delivery).permit(:broker_id, :supplier_id, :receiver_id, :driver_id, :height, :weight, :hazardous, :pickup_time, :description, :status)
    end


end
