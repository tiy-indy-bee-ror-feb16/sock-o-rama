class CreateSockImages < ActiveRecord::Migration[5.0]
  def change
    create_table :sock_images do |t|
      t.string :url
      t.references :sock, foreign_key: true

      t.timestamps
    end
  end
end
