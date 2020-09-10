class Receiver < ApplicationRecord
    has_many :deliveries
    has_many :drivers, through: :deliveries
    has_many :brokers, through: :deliveries
    has_many :suppliers, through: :deliveries
    



    def company_id
        x = self.company.first(3).upcase
        y = rand(111..9999).to_s
        x + y
    end

    
end
