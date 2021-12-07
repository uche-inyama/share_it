class AddPhotoDatatoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :photo_data, :text
  end
end
