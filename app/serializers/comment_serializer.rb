class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :count
  has_one :user
  has_one :project
end
