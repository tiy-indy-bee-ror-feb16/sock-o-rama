class Order < ApplicationRecord

  belongs_to :address # and address belongs to user, user has many addresses will take care of the rest of the relationship?
  has_many :order_items
  validates :order_item, :total, presence: true
  validates :total, numericality: true
  before_save :update_subtotal

  def subtotal
    order_items.map { |item| item.valid? ? (item.quantity * item.price) : 0 }.sum
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
