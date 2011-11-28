class IdeaResourceVote < ActiveRecord::Base

	belongs_to :user
	belongs_to :idea_resource
	
end
