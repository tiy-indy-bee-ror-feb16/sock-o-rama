class Sock < ApplicationRecord
  include PgSearch
  has_many :sock_sizes
  has_many :sizes, through: :sock_sizes
  has_many :sock_images
  validates_presence_of :style, :name, :price, :color, :category
  validates_numericality_of :price

  pg_search_scope :search,
    :against => {
      :name => 'A',
      :style => 'B',
      :color => 'C'
    }
end
