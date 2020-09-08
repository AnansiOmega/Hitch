class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.integer :broker_id
      t.integer :driver_id
      t.integer :supplier_id
      t.integer :receiver_id
      t.boolean :hazardous, default: false
      t.string :pickup_time
      t.string :arrival_time
      t.string :dropoff_time
      t.boolean :pickup, default: false
      t.boolean :dropoff, default: false
      t.string :status
      t.string :height
      t.string :weight
      t.text :description

      t.timestamps
    end
  end
end