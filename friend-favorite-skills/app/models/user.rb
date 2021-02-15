class User < ActiveRecord::Base
    has_many :favorites
    has_many :categories, through: :experiences
    has_secure_password
end
