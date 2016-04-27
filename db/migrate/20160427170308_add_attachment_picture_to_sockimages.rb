class AddAttachmentPictureToSockimages < ActiveRecord::Migration
  def self.up
    change_table :sock_images do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :sock_images, :picture
  end
end
