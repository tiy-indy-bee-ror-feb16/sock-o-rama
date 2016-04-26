class SockImage < ApplicationRecord
  belongs_to :sock
  validates_presence_of :url
end
