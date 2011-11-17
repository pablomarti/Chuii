class Category < ActiveRecord::Base

	has_many :ideas

	def self.getCategories
		order("category ASC")
	end

	def self.getCategoriesWithAll
		categories = order("category ASC")
		categories.unshift(Category.new({:id => 0, :category => "All categories"}))
	end
	
end
