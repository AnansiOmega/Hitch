class Broker < ApplicationRecord
    has_secure_password
    has_many :deliveries
    has_many :drivers, through: :deliveries
    has_many :receivers, through: :deliveries
    has_many :suppliers, through: :deliveries
 

    def new_delivery
        self.deliveries.filter do |delivery|
            delivery.status == "Awaiting Pickup"
        end
    end

    def transit_delivery
        self.deliveries.filter do |delivery|
            delivery.status == "In Transit"
        end
    end

    def delivered_delivery
        self.deliveries.filter do |delivery|
            delivery.status == "Delivery Completed"
        end
    end

    
end





