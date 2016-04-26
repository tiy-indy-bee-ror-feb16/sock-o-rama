class Address < ApplicationRecord
  has_many :orders
  belongs_to :user
  validates :street, :city, :state, :zip, presence: true
  validates_inclusion_of :state, in: Carmen::state_codes('US')
  validates :zip, format: { with: /[0-9]\{5\}(-[0-9]\{4\})?/,
    message: "please enter a valid 5-digit zip code" }

  def address
    [street, city, state, zip].join(',')
  end
end
