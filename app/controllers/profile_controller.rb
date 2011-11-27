class ProfileController < ApplicationController

	def index
		@selectedUser = User.find(params[:id]) rescue nil
		if @selectedUser.nil?
			redirect_to index_path
			return
		end

		@ideas = @selectedUser.ideas.order("id DESC")
	end

	def loadProfileIdeas
		@selectedUser = User.find(params[:id]) rescue nil
		if @selectedUser.nil?
			return
		end

		item = params[:item].to_i
		@ideas = []

		if item == 1
			@ideas = @selectedUser.popularIdeas
		elsif item == 2
			@ideas = @selectedUser.ideas.order("id DESC")
		elsif item == 3
			@ideas = @selectedUser.favoriteIdeas
		end
	end

end
