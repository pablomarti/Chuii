class IdeaLinks < ActiveRecord::Base

	belongs_to :idea
	belongs_to :source
	belongs_to :sourcekind
	has_many :tag_idea_links, :dependent => :destroy

	#Self-Join, reference: http://jonathanhui.com/ruby-rails-3-model-association
  	has_many :childrenlinks, :class_name => "IdeaLinks", :foreign_key => "parentlink_id"
  	belongs_to :parentlink, :class_name => "IdeaLinks"
	
end
