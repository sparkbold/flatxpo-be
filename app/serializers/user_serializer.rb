class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :avatar, :bio, :github_username, :views
  has_many :projects, :votes, :comments
  has_many :projects, through: :votes
  has_many :projects, through: :comments
end
