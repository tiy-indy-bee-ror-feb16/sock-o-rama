class Sock < ApplicationRecord
  has_many :sock_size

  validates_presence_of :style, :name, :price, :color, :material

end
