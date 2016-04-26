class AddCategoryToSocks < ActiveRecord::Migration[5.0]
  def change
    add_column :socks, :category, :string
  end
end
