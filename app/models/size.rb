class Size < ApplicationRecord
  VALID_SIZES = %w(XXS XS S M L XL XXL XXXL).freeze
  validates :size, presence: true
  validates_inclusion_of :size, in: VALID_SIZES
  before_validation :uppercase

  private

  def uppercase
    self.size.upcase! unless self.size.nil?
  end
end
