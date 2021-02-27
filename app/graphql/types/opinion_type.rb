module Types
  class OpinionType < Types::BaseObject
    field :id, ID, null: false
    field :text, String, null: true
    field :author_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
