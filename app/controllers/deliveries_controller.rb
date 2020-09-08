class DeliveriesController < ApplicationController
    def index
        @deliveries = Delivery.all
    end

    def show
        @delivery = Delivery.find(params[:id])
    end
end
