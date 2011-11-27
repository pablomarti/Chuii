class VoteManagerController < ApplicationController
	
	def makeVote
		@id = params[:id]
		@item = params[:item]
		@valoration = params[:valoration].to_i
		@couldSave = false

		logger.debug "VALORATION: " + @valoration.to_s

		@auxId = "#{@item}_b"
		@auxIdOther = "#{@item}_g"
		if @valoration == 1
			@auxId = "#{@item}_g"
			@auxIdOther = "#{@item}_b"
		end

		logger.debug "AUX: " + @auxId

		if @item == "idea"
			@userVote = IdeaVote.create({:user_id => @user.id, :idea_id => @id, :valoration => @valoration})
			if @userVote.save
				@couldSave = true
			end
		end
	end

end
