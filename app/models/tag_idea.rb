class TagIdea < ActiveRecord::Base

	belongs_to :tag
	belongs_to :idea

end
