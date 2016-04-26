class Sock < ApplicationRecord
  has_many :sizes, through: :sock_sizes
  validates_presence_of :style, :name, :price, :color, :material
  validates_numericality_of :price
end
