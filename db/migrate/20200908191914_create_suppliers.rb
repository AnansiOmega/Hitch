class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :company
      t.string :location

      t.timestamps
    end
  end
end
