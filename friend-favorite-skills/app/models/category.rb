class Category < ActiveRecord::Base
    has_many :users, through: :favorites
    #has_many :favorites, through: :user_favorites
end
