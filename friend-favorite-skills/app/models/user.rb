class User < ActiveRecord::Base
    has_secure_password 
    has_many :favorites, class_name:"Favorite", foreign_key: "user_id"
    has_many :categories, through: :favorites
end
