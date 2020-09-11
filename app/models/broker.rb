class Broker < ApplicationRecord
    has_secure_password
    has_many :deliveries
    has_many :drivers, through: :deliveries
    has_many :receivers, through: :deliveries
    has_many :suppliers, through: :deliveries
    validates :name, :email, :password_digest, presence: true
    validates :name, :email, uniqueness: true
    validate :real_email?


    def real_email? # Verifies if email has an @ and the 4th to last position of email field is a period.
       if self.email.include?("@") && self.email.last(4).first == "."
        true
       else
        errors.add(:email, "must be valid")
       end
    end
 

    def new_delivery # Gives an array of deliveries that only have the status of "Awaiting Pickup"
        self.deliveries.filter do |delivery|
            delivery.status == "Awaiting Pickup"
        end
    end

    def transit_delivery # Gives an array of deliveries that only have the status of "In Transit"
        self.deliveries.filter do |delivery|
            delivery.status == "In Transit"
        end
    end

    def delivered_delivery # Gives an array of deliveries that only have the status of "Delivery Completed"
        self.deliveries.filter do |delivery|
            delivery.status == "Delivery Completed"
        end
    end

    
end





