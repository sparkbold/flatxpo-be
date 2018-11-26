class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :description, :image, :github_url, :demo_url, :views, :votes, :comments
  has_one :user

  def votes
    self.object.votes
  end

  def comments
    self.object.comments
  end

end
