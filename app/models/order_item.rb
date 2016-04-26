class OrderItem < ApplicationRecord
  belongs_to :order
  has_many :sock_sizes
  validates :quantity, presence: true, numericality: true
end
