class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :email, :first_name, :last_name, :avatar, :bio, :github_username, :views, :votes, :comments, :avatar_url
  has_many :projects

  def votes
    self.object.votes
  end

  def comments
    self.object.comments
  end

  def avatar_url
    url_for(object.img) if object.img.attached?
  end

end
