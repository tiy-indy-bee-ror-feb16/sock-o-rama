class Size < ApplicationRecord
  has_many :sock_size

  validates_presence_of :size

end
