class AddUserColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :user_id, :integer
  end
end
