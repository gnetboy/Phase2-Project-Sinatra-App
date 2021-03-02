class ModifyFavotites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :commnt_id, :comment_id
  end
end
