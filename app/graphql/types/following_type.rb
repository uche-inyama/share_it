module Types
  class FollowingType < Types::BaseObject
    field :id, ID, null: false
    field :follower_id, Integer, null: true
    field :followed_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
