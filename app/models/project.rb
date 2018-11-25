class Project < ApplicationRecord
  belongs_to :user
  has_many :votes, :comments, :project_tags
  has_many :tags, through: :project_tags
end
