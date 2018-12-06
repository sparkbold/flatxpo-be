  #  include Rails.application.routes.url_helpers
  #  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
class User < ApplicationRecord

  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
  has_many :projects
  has_many :votes
  has_many :comments

  has_one_attached :img
 
end
