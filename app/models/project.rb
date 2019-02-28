   include Rails.application.routes.url_helpers
   Rails.application.routes.default_url_options[:host] = 'localhost:3000'
class Project < ApplicationRecord
  belongs_to :user

  has_many :project_tags, dependent: :destroy
  has_many :tags, through: :project_tags
  
  has_many :votes, dependent: :destroy
  has_many :voters
  has_many :users, :as => :voters, through: :votes

  has_many :comments, dependent: :destroy
  has_many :commenters
  has_many :users, :as => :commenters, through: :comments

  alias_attribute :voters, :users
  alias_attribute :commenters, :users

  has_one_attached :img

  validates :title, presence: true
end
