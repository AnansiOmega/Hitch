class Driver < ApplicationRecord
    has_secure_password
    has_many :deliveries
    has_many :brokers, through: :deliveries
    has_many :receivers, through: :deliveries
    has_many :suppliers, through: :deliveries
    
end
