class ChangeOrderColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :total, :price
  end
end
