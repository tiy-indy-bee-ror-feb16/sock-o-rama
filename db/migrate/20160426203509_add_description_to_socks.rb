class AddDescriptionToSocks < ActiveRecord::Migration[5.0]
  def change
    add_column :socks, :description, :text
  end
end
