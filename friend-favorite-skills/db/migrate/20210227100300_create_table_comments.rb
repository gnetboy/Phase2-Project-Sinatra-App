class CreateTableComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.datetime :timestamp
      t.integer :user_id
      t.integer :favorites_id
    end

  end
end
