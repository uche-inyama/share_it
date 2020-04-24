class AddAttributesToFollowing < ActiveRecord::Migration[6.0]
  def change
    add_column :followings, :follower_id, :integer
    add_column :followings, :followed_id, :integer
  end
end
