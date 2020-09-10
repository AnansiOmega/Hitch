class SuppliersController < ApplicationController
    before_action :authorized_broker, :authorized_driver
    skip_before_action :authorized_driver



    def index
        @suppliers = Supplier.all
    end

    def show
        @supplier = Supplier.find(params[:id])
        flash[:supplier_id] = @supplier.id
    end


end
