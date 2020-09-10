class Driver < ApplicationRecord
    has_secure_password
    has_many :deliveries
    has_many :brokers, through: :deliveries
    has_many :receivers, through: :deliveries
    has_many :suppliers, through: :deliveries
    validates :name, :email, :password_digest, presence: true
    validates :name, :email, uniqueness: true
    validate :real_email?

    def real_email?
       if self.email.include?("@") && self.email.last(4).first == "."
        true
       else
        errors.add(:email, "must be valid")
       end
    end

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

    def actual_arrival_display
        if self.actual_arrival == nil
        self.actual_arrival
        else
        self.actual_arrival.strftime("%A, %H:%M %p")
        end
    end
end
