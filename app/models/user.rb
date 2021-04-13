class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :friends, foreign_key: "follower_id"
  has_many :clocks
end
