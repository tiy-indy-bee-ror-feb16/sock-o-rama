class Order < ApplicationRecord

  belongs_to :address # and address belongs to user, user has many addresses will take care of the rest of the relationship?
  has_many :order_items
  validates :order_item, :total, presence: true
  validates :total, numericality: true

  def subtotal
    order_items.map { |item| item.valid? ? (item.quantity * item.price) : 0 }
  end

end
