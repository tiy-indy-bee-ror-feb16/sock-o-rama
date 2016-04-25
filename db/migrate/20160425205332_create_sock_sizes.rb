class CreateSockSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sock_sizes do |t|
      t.references :size, foreign_key: true
      t.references :sock, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
