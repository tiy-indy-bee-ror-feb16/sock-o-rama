class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :addresses

  before_validation :downcase_email
  validates :name, :email, :role, presence: true
  validates :email, uniqueness: true
  validates :password, length: {
    minimum: 8,
    too_short: "Password must be at least 8 characters",
    maximum: 25,
    too_long: "Password must be less than 25 characters"
  }
  validate :email_is_valid_format
  before_save :set_default_avatar


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  private

  def email_is_valid_format
    errors.add(:email, "Not a valid email address") unless self.email =~ VALID_EMAIL_REGEX
  end

  def downcase_email
    email.downcase! if email
  end

  def set_default_avatar
     self.avatar ||= "https://unsplash.it/400/?image=1061"
  end

end
