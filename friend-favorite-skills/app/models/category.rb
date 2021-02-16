class Category < ActiveRecord::Base
    has_many :favorite_categories
    has_many :favorites, through: :favorites_categories
    has_many :users, through: :favorites
end
