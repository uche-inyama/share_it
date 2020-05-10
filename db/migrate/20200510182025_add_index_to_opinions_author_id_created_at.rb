class AddIndexToOpinionsAuthorIdCreatedAt < ActiveRecord::Migration[6.0]
  def change
    add_index :opinions, [:author_id, :created_at]
  end
end
