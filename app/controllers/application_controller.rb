class ApplicationController < ActionController::Base

  	protect_from_forgery

  	before_filter :checkSession

  	def checkSession
      @user = nil
  		if !session[:userId].nil?
  			@user = User.find(session[:userId])
  		end
  	end

    def userLogedIn
      return !session[:userId].nil?
    end

    def logout
	    session.destroy
	    redirect_to '/main/index'
  	end

end
