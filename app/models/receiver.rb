class Receiver < ApplicationRecord
    has_many :deliveries
    has_many :drivers, through: :deliveries
    has_many :brokers, through: :deliveries
    has_many :suppliers, through: :deliveries
    

end
