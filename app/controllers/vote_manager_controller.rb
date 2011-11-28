class VoteManagerController < ApplicationController
	
	#Make a vote for an idea, a comment or a resource
	def makeVote
		@id = params[:id]
		@item = params[:item]
		@valoration = params[:valoration].to_i
		@couldSave = false

		@auxId = "#{@item}_#{@id}_b"
		@auxIdOther = "#{@item}_#{@id}_g"
		if @valoration == 1
			@auxId = "#{@item}_#{@id}_g"
			@auxIdOther = "#{@item}_#{@id}_b"
		end

		if @item == "idea"
			baseClass = IdeaVote
			element = "idea_id"
		elsif @item == "resource"
			baseClass = IdeaResourceVote
			element = "idea_resource_id"
		elsif @item == "comment"
			baseClass = UserIdeaVote
			element = "user_idea_id"
		end

		@userVote = baseClass.where({:user_id => @user.id, element => @id}).first
		if @userVote.nil?
			@userVote = baseClass.create({:user_id => @user.id, element => @id, :valoration => @valoration})
			if @userVote.save
				@couldSave = true
			end
		else
			if @userVote.update_attribute("valoration", @valoration)
				@couldSave = true
			end
		end
	end

end
