class Project < ApplicationRecord
  belongs_to :user

  has_many :project_tags
  has_many :tags, through: :project_tags
  
  has_many :votes
  has_many :voters
  has_many :users, :as => :voters, through: :votes

  has_many :comments
  has_many :commenters
  has_many :users, :as => :commenters, through: :comments

  alias_attribute :voters, :users
  alias_attribute :commenters, :users

  has_one_attached :img
end
