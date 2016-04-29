class Order < ApplicationRecord

  belongs_to :user
  has_many :order_items, dependent: :destroy
  validates :order_items, :total, presence: true
  validates :total, numericality: true
  before_save :update_subtotal, :update_tax, :update_total

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

  def update_tax
    self[:tax] = tax
  end

  def update_total
    self[:total] = total
  end

end
