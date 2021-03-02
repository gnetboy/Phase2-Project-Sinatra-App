class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment
      t.references :favorite
      t.references :user
      t.timestamps null: false
    end
  end
end
