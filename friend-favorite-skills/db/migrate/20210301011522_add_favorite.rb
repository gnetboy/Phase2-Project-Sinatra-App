class AddFavorite < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :title
      t.string :content
      t.string :category
      t.integer :user_id
      t.integer :commnt_id
    end
  end
end
