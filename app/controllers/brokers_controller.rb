class BrokersController < ApplicationController
    before_action :authorized_broker, :logged_in_broker
    skip_before_action :authorized_broker, only: [:new,:create,:index,:show]
   
    
    def index
        @brokers = Broker.all
    end

    def show
        @broker = Broker.find(params[:id])
        @broker_current = @broker.new_delivery + @broker.transit_delivery
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
        @suppliers = Supplier.all
    end

    def drop_off
        supplier = Supplier.find(params[:id])
        redirect_to supplier_path(supplier)
    end

    def history
        @broker = Broker.find(session[:broker_id])
        @supplier = Supplier.find_by(id: flash[:supplier_id])
        if @supplier.nil?
            redirect_to brokers_dropped_off_path
        end
    end
    

    private

    def broker_params
        params.require(:broker).permit(:name,:email, :password)
    end
end