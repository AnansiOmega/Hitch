class Delivery < ApplicationRecord
    belongs_to :broker
    belongs_to :supplier
    belongs_to :driver
    belongs_to :receiver 


    def pickup
        self.pickup = true
        self.actual_arrival = DateTime.now
        self.status = "In Transit"
        self.save
    end

    def dropoff
        self.dropoff = true
        self.actual_dropoff = DateTime.now
        if self.pickup = true
            self.status = "Delivery Completed"
        else
            self.status = "Dropoff Complete - No Pickup Information Logged"
        end
        self.save
    end

    def actual_arrival_display
        if self.actual_arrival == nil
        self.actual_arrival
        else
        self.actual_arrival.strftime("%A, %H:%M %p")
        end
    end

    def actual_dropoff_display
        if self.actual_dropoff == nil
        self.actual_dropoff
        else
        self.actual_dropoff.strftime("%A, %H:%M %p")
        end
    end

end