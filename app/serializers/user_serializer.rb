class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :avatar, :bio, :github_username, :views, :votes, :comments
  has_many :projects

  def votes
    self.object.votes
  end

  def comments
    self.object.comments
  end

end
