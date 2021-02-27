class Comment < ActiveRecord::Base
    belongs_to :favorites
    belongs_to :user
end