class Size < ApplicationRecord

  VALID_SIZES = %w(S M L XL)

  validates :size, presence: true
  validates_inclusion_of :size, in: VALID_SIZES
end
