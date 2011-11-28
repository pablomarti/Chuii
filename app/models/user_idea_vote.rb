class UserIdeaVote < ActiveRecord::Base

	belongs_to :user
	belongs_to :user_idea
	
end
