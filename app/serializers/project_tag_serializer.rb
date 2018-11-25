class ProjectTagSerializer < ActiveModel::Serializer
  attributes :id
  has_one :tag
  has_one :project
end
