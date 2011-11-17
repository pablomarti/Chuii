#For Debian
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class FacebookController < ApplicationController

  	APP_ID = "256346081083941"
  	APP_SECRET = "5dc0e63a799486a2254c9af08ad1d63f"
  	APP_CODE = "Chui"
  	SITE_URL = "http://localhost:3000/"

  	def login
		session['oauth'] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + 'facebook/callback')
		redirect_to session['oauth'].url_for_oauth_code()
  	end

	def callback
		session['access_token'] = session['oauth'].get_access_token(params[:code])
		graph = Koala::Facebook::GraphAPI.new(session["access_token"])
		data = graph.get_object('me')

		logger.debug data.inspect

		user = User.where(:fb_id => data["id"]).first rescue nil
		if user.nil?
			user = User.new({   :fb_id => data["id"],
								:name => data["first_name"],
								:lastname => data["last_name"],
								:sex => (data["gender"] == 'male') ? true : false,
								:timezone => data["timezone"],
								:fb_username => data["username"],
								:fb_link => data["link"] })
			if user.save
				session[:userId] = user.id
			end
		else
			session[:userId] = user.id
		end
		
		redirect_to index_path
	end

end
