class UserIdea < ActiveRecord::Base

	belongs_to :user
	belongs_to :idea
	has_many :user_idea_votes, :dependent => :destroy #comments

	validates :comment, :presence => true
	
end
