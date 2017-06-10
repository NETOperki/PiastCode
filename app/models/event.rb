class Event < ApplicationRecord
  belongs_to :user
  has_many :joined
  has_many :posts
end