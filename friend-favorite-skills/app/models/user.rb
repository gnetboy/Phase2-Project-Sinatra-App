class User < ActiveRecord::Base
    validates :name, :email, :password, presence: true, :on => :create
    has_secure_password 
    has_many :favorites, class_name:"Favorite", foreign_key: "user_id"
    has_many :categories, through: :favorites
end
