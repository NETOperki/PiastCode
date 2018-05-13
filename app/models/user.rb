class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :name, presence: true, lenght: {maximum: 64}
  validates :email, presence: true, lenght: {maximum: 255},
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: {case_sensitive: false}

  has_many :events
  has_many :joined
  has_many :posts
end
