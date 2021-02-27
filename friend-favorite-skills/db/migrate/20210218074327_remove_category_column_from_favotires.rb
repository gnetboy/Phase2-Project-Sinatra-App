class RemoveCategoryColumnFromFavotires < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites,  :category
  end
end
