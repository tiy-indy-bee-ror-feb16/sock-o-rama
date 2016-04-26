class Order < ApplicationRecord

  belongs_to :address # and address belongs to user, user has many addresses will take care of the rest of the relationship?
  has_many :order_items
  validates :order_item, :total, presence: true
  validates :total, numericality: true

end
