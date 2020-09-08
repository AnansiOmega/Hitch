class Supplier < ApplicationRecord
    has_many :deliveries
    has_many :drivers, through: :deliveries
    has_many :receivers, through: :deliveries
    has_many :brokers, through: :deliveries
    
end
