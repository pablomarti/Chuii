class MainController < ApplicationController

	def whatsNew
	end

	def index
		@ideas = Idea.latestIdeas
	end

	def loadIdeas
		id = params[:id].to_i
		@ideas = []

		if id == 1
			@ideas = Idea.latestIdeas
		elsif id == 2
			@ideas = Idea.topIdeas
		elsif id == 3
			if userLogedIn
				@ideas = @user.suggestedIdeas
			end
		elsif id == 4
			if userLogedIn
				@ideas = @user.favoriteIdeas
			end
		elsif id == 5
			if userLogedIn
				@ideas = @user.ideas
			end
		end
	end

	def search
		@loadMore = false
		@message = ""

		if params[:search].nil?
			#Search by form
			search = params[:data][:search]
			category_id = params[:data][:category_id].to_i
		else
			#Search by tag
			search = params[:search]
			category_id = 0
		end

		if search != "" || search.length < 3
			data =  Idea.simpleSearch(search, category_id)
			@ideas = data[0]
			@totalElements = data[1]

			session[:searchData] = {:search => search, :category_id => category_id, :page => data[2], :per_page => data[3]}

			if @totalElements > @ideas.count
				@loadMore = true
			end
		else
			@message = "Your search was to short. Please make a valid search"
			@ideas = []
			@totalElements = 0
		end

		@searchTxt = search
	end

	def loadMore
		session[:searchData][:page] += 1
		data =  Idea.simpleSearch(session[:searchData][:search], session[:searchData][:category_id], session[:searchData][:page], session[:searchData][:per_page])
		
		logger.debug "IDEAS: " + data[0].inspect
		@loadMore = false
		@ideas = data[0]
		@totalElements = data[1]

		totalPages = (@totalElements/session[:searchData][:per_page]).to_i
		totalPages += (@totalElements%session[:searchData][:per_page] > 0) ? 1 : 0

		if totalPages > session[:searchData][:page]
			@loadMore = true
		end
	end
	
end
