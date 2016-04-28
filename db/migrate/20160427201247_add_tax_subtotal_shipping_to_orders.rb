class AddTaxSubtotalShippingToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :tax, :integer
    add_column :orders, :subtotal, :integer
    add_column :orders, :shipping, :integer
  end
end
