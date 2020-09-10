class ReceiversController < ApplicationController
    before_action :authorized_broker, :authorized_driver


    def index
        @receivers = Receiver.all
    end

    def show
        @receiver = Receiver.find(params[:id])
    end
end
