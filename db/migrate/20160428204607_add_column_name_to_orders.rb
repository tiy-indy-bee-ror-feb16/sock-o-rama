class AddColumnNameToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :name, :string
    add_column :orders, :permalink, :string
  end
end
