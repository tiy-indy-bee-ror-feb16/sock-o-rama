class CreateSocks < ActiveRecord::Migration[5.0]
  def change
    create_table :socks do |t|
      t.string :style
      t.string :name
      t.integer :price
      t.string :color
      t.string :material

      t.timestamps
    end
  end
end
