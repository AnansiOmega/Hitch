class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.integer :broker_id
      t.integer :driver_id
      t.integer :supplier_id
      t.integer :receiver_id
      t.boolean :hazardous, default: false
      t.datetime :scheduled_pickup
      t.datetime :actual_arrival
      t.datetime :actual_dropoff
      t.boolean :pickup, default: false
      t.boolean :dropoff, default: false
      t.string :status, default: "Awaiting Pickup"
      t.string :height
      t.string :weight
      t.text :description

      t.timestamps
    end
  end
end