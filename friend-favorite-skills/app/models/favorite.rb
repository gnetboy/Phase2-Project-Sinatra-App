class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    has_many :user_favorites
    
    
    def self.create_new(details,session_uid)
        @details = details
        @user = User.find[user.id]
    
    
    
        @favorite = Favorite.new(
          :description => @details,
          :category => @category_name,
        )
    
        @favorite.save
    
    end
end
