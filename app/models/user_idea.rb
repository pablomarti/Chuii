class UserIdea < ActiveRecord::Base

	belongs_to :user
	belongs_to :idea

	validates :comment, :presence => true
	
end
