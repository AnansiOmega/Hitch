class Supplier < ApplicationRecord
    has_many :deliveries
    has_many :drivers, through: :deliveries
    has_many :receivers, through: :deliveries
    has_many :brokers, through: :deliveries



    def company_id(delivery_id) # Creates a custom load id to each delivery associated with company
        x = self.company.first(3).upcase
        y = delivery_id * delivery_id 
        y.to_s.first(7)
        x + y.to_s
    end

    def brokers_history(broker_id) # Shows the history of a brokers relationship between supplier (through deliveries)
        self.deliveries.filter do |delivery|
            delivery.broker.id == broker_id
        end
    end
    
end
