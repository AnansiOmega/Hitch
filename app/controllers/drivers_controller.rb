class DriversController < ApplicationController
    before_action :authorized_broker
    skip_before_action :authorized_broker


    def index
        @drivers = Driver.all
    end
end
