module ApplicationHelper

	###################################################################### Functions
	
	def userLogedIn
		return !session[:userId].nil?
	end

	def getCategories
		Category.getCategories
	end

	def currentUser
		User.find(session[:userId])
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

	def getTags
		tags = ""
		coma = ""
		data = Tag.order("name ASC")
		data.map{ |tag|
			tags += coma + "'#{tag.name}'"
			coma = ","
		}
		return tags
	end

	def ideaTags(tags)
		render :partial => "ideaTags", :locals => {:tags => tags}
	end

	def clearBox
		raw '<div class="clear"></div>'
	end

	def preselectVote(item, id = 0)
		auxId = ""
		if id != 0
			if item == "idea"
				baseClass = IdeaVote
				element = "idea_id"
			elsif item == "resource"
				baseClass = IdeaResourceVote
				element = "idea_resource_id"
			elsif item == "comment"
				baseClass = UserIdeaVote
				element = "user_idea_id"
			end

			userVote = baseClass.where(:user_id => currentUser.id, element => id).first
			if !userVote.nil?
				auxId = "#{item}_#{id}_" + (userVote.valoration ? "g" : "b")
			end
		end

		str = ""
		if auxId != ""
			str = "<script type='text/javascript' language='javascript'>$('#" + auxId + "').addClass('selectedLink');</script>"
		end

		raw str
	end

end
