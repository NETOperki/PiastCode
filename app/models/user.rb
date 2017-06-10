class User < ApplicationRecord
  has_many :events
  has_many :joined
  has_many :posts
end
