class Supplier < ApplicationRecord
    has_many :deliveries
    has_many :drivers, through: :deliveries
    has_many :receivers, through: :deliveries
    has_many :brokers, through: :deliveries



    def company_id
        x = self.company.first(3).upcase
        y = rand(111..9999).to_s
        x + y
    end

    def brokers_history(broker_id)
        self.deliveries.filter do |delivery|
            delivery.broker.id == broker_id
        end
    end
    
end
