module ApplicationHelper

	def userLogedIn
		return !session[:userId].nil?
	end

	def getCategories
		Category.getCategories
	end

	def clearBox
		raw '<div class="clear"></div>'
	end
	
end
