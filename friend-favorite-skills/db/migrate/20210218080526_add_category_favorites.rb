class AddCategoryFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :category_id, :integer
  end
end
