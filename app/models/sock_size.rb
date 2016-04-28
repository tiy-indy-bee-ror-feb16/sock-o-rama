class SockSize < ApplicationRecord
  belongs_to :size
  belongs_to :sock
  has_many :order_items
  validates_presence_of :quantity
  validates_numericality_of :quantity
end
