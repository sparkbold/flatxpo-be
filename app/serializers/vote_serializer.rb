class VoteSerializer < ActiveModel::Serializer
  attributes :id, :count
  has_one :user
  has_one :project
end
