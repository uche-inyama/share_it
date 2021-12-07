class RemoveCoverImageFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :coverimage, :string
  end
end
