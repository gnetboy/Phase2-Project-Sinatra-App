class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
        t.string :description
        t.string :category
    end
  end
end
