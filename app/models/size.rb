class Size < ApplicationRecord
  VALID_SIZES = %w(XXS XS S M L XL XXL XXXL).freeze
  validates_presence_of :size
  validates_inclusion_of :size, in: VALID_SIZES
  has_many :socks, through: :sock_sizes
  before_validation :uppercase

  private

  def uppercase
    self.size.upcase! unless self.size.nil?
  end
end
