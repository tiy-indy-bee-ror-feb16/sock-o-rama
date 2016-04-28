class Order < ApplicationRecord

  # belongs_to :address # and address belongs to user, user has many addresses will take care of the rest of the relationship?
  has_many :order_items
  validates :order_items, :price, presence: true
  validates :price, numericality: true
  before_save :update_subtotal, :update_tax, :update_total
  include Payola::Sellable

  def subtotal
    order_items.map { |item| item.valid? ? (item.quantity * item.price) : 0 }.sum
  end

  def tax
    subtotal * 0.7
  end

  def total
    subtotal + tax
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_tax
    self[:tax] = tax
  end

  def update_total
    self[:price] = total
  end

end
