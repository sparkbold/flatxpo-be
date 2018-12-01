class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :description, :image, :github_url, :demo_url, :views, :votes, :comments, :vote_count, :comment_count, :created_at
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

  # def commenter
  #   self.object.comments.map do |comment|
  #     {comment: comment, user: comment.user}
  #   end
  # end

end
