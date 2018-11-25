class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
  has_many :projects, :votes, :comments
  has_many :projects, through: :votes
  has_many :projects, through: :comments
end
