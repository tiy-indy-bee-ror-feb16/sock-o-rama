class Order < ApplicationRecord
  # belongs_to :address # and address belongs to user, user has many addresses will take care of the rest of the relationship?
  belongs_to :user
  before_validation :update_subtotal, :update_tax, :update_total
  has_many :order_items
  validates :order_items, :price, presence: true
  validates :price, numericality: true
  include Payola::Sellable
  has_paper_trail

  def subtotal
    order_items.map { |item| item.valid? ? (item.quantity * item.price) : 0 }.sum
  end

  def shipping
    item_count * 2
  end

  def tax
    subtotal * 0.07
  end

  def total
    subtotal + tax + shipping
  end

  def item_count
    order_items.inject(0) { |sum, oi| sum += oi.quantity }
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_total
    self[:price] = total * 100
  end

  def update_tax
    self[:tax] = tax
  end

end
