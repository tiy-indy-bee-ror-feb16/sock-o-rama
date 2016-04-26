class OrderItem < ApplicationRecord
  belongs_to :order
  has_many :socks
  has_many :sock_sizes, through: :socks
  has_many :sizes, through: :sock_sizes # <-- Is this necessary?
  validates :socks, presence: true
end
