class Sock < ApplicationRecord
  has_many :sizes through: :sock_sizes
  validates_presence_of :style, :name, :price, :color, :material
end
