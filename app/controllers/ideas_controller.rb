class IdeasController < ApplicationController

	def newIdea
	end

	def saveIdea
		@couldSave = false

		tags = []
		if !params[:item].nil?
			tags = params[:item][:tags]
		end
		
		@id = 0
		if params[:id].nil?
			params[:idea][:user_id] = @user.id
			@idea = Idea.new(params[:idea])
			if @idea.save
				@idea.addTags(tags)
				@couldSave = true

				redirect_to :controller => "ideas", :action => "idea", :id => @idea.id 
			else
			end
		else
			@id = params[:id].to_i
			@idea = Idea.find(@id)
			if !@idea.nil?
				if @idea.update_attributes(params[:idea])
					@idea.updateTags(tags)
					@couldSave = true
				else
				end
			end
		end
	end

	def idea
		@idea = Idea.find(params[:id]) rescue nil
		@similarIdeas = @idea.similarIdeas

		if @idea.nil?
			redirect_to :controller => "main", :action => "index"
			return
		end

		@comments = @idea.user_ideas
		@resources = @idea.idea_resources
		
		#tweets = ConnectorController::getTweets("pablomarti89")
		#wikiCategories = WikiConnectorController::getPages("hades")
		#logger.debug "DATA: " + wikiCategories.inspect
	end

	def newResource
		@couldSave = false
		@ideaResource = IdeaResource.new(params[:resource])
		@ideaResource.user_id = @user.id
		#@idea = @ideaResource.idea
		if @ideaResource.save
			@couldSave = true
		end
	end

	def editIdea
		@idea = Idea.find(params[:id]) rescue nil
	end

	def cancelEditIdea
		@idea = Idea.find(params[:id]) rescue nil
	end

	def addToFavorites
		@idea = Idea.find(params[:id]) rescue nil
		if !@idea.nil?
			@user.addToFavorites(@idea)
		end
	end

	def removeFromFavorites
		@idea = Idea.find(params[:id]) rescue nil
		if !@idea.nil?
			@user.removeFromFavorites(@idea)
		end
	end

end
