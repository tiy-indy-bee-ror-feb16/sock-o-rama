class Order < ApplicationRecord

  belongs_to :address # and address belongs to user, user has many addresses will take care of the rest of the relationship?
  has_many :socks
  has_many :sock_sizes, through: :socks
  has_many :sizes, through: :sock_sizes # <-- Is this necessary?
  validates :order_items, :order_total, presence: true
  validates :order_total, numericality: true

end
