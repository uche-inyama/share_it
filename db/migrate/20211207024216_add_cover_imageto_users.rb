class AddCoverImagetoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :coverimage_data, :text
  end
end
