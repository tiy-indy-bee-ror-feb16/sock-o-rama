class SockSize < ApplicationRecord
  belongs_to :size
  belongs_to :sock
  validates_presence_of :quantity
end
