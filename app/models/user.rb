class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
  has_many :projects
  has_many :votes
  has_many :comments
 
end
