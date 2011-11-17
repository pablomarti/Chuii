class MyAccountController < ApplicationController

	def index
		@ideas = @user.ideas
	end

end
