class Sock < ApplicationRecord
  has_many :sizes, through: :sock_sizes
  has_many :sock_images
  validates_presence_of :style, :name, :price, :color, :category
  validates_numericality_of :price
end
