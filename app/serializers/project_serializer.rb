class ProjectSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :slug, :title, :description, :image, :github_url, :demo_url, :views, :votes, :comments, :vote_count, :comment_count, :created_at, :project_tags, :img_url
  has_one :user

  def votes
    self.object.votes
  end

  def vote_count
    self.object.votes.size
  end

  def comments
    self.object.comments
  end

  def comment_count
    self.object.comments.size
  end

  def project_tags
    self.object.tags.map do |tag|
      tag.name
    end
  end

  def img_url
    url_for(object.img) if object.img.attached?
  end

end
