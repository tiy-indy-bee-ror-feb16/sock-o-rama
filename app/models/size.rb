class Size < ApplicationRecord
  has_many :socks, through: :sock_sizes
  validates_presence_of :size
end
