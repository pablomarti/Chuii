class CommentsController < ApplicationController

	def newComment
		@id = params[:id]
		@item = params[:item]
		@userComment = params[:comment][:comment]
		@couldSave = false

		if @item == "idea"
			@ideaComment = UserIdea.create({:user_id => @user.id, :idea_id => @id, :comment => @userComment})
			if @ideaComment.save
				@couldSave = true
			end
		end
	end

end
