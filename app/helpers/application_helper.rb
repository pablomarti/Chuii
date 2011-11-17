module ApplicationHelper

	###################################################################### Functions
	
	def userLogedIn
		return !session[:userId].nil?
	end

	def getCategories
		Category.getCategories
	end

	######################################################################### Links

	def link_to_profile(user)
		link_to user.fullName, profile_path(user.id)
	end

	def link_to_idea(idea, text = "")
		if text == ""
			link_to idea.idea, idea_path(idea.id)
		else
			link_to text, idea_path(idea.id)
		end
	end

	def link_to_category(category)
		link_to category.category, "#"
	end

	def link_to_tag(tag)
		link_to tag.name, {:controller => "main", :action => "search", :search => tag.name}
	end
	
	###################################################################### Auxiliars

	def ideaTags(tags)
		render :partial => "ideaTags", :locals => {:tags => tags}
	end

	def clearBox
		raw '<div class="clear"></div>'
	end

end
