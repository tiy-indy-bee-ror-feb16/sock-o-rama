class SockImage < ApplicationRecord
  belongs_to :sock
  validates_presence_of :url
  before_save :picture_from_url
  has_attached_file :picture, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  def picture_from_url
    self.picture = URI.parse(url)
  end
end
