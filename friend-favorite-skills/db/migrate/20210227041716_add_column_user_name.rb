class AddColumnUserName < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :timestamps, :timestamps
  end
end
