class SuppliersController < ApplicationController
    before_action :authorized_broker, :authorized_driver
end
