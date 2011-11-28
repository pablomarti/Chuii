class IdeaResource < ActiveRecord::Base

	belongs_to :user
	belongs_to :idea
	has_many :idea_resource_votes, :dependent => :destroy
	
end
