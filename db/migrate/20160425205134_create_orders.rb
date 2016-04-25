class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :shipped
      t.integer :total
      t.boolean :complete

      t.timestamps
    end
  end
end
