class CreateReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :receivers do |t|
      t.string :company
      t.string :location

      t.timestamps
    end
  end
end

