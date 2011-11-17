class Tag < ActiveRecord::Base

	has_many :tag_ideas, :dependent => :destroy
	has_many :ideas, :through => :tag_ideas

end
