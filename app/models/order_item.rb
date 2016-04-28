class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :sock_size
  validates :quantity, presence: true, numericality: true

  def price
    sock_size.sock.price
  end

  def total_price
    price * quantity
  end

end
