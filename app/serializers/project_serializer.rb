class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :description, :image, :github_url, :demo_url, :views
  has_one :user
  has_many :votes, :comments, :project_tags
  has_many :tags, through: :project_tags
end
