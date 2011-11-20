class Sourcekind < ActiveRecord::Base
	
	has_many :idea_links

	validates :name, :presence => true, :uniqueness => true

end
