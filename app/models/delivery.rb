class Delivery < ApplicationRecord
    belongs_to :broker
    belongs_to :supplier
    belongs_to :driver
    belongs_to :receiver 

end