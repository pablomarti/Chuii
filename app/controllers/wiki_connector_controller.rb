require 'open-uri'
require 'json'

class WikiConnectorController < ApplicationController

	def self.getCategories(search)
	  	buffer = open("http://search.twitter.com/search.json?q=#{search}&rpp=#{TOTAL_TWEETS}&include_entities=true&result_type=mixed").read
	  	tmpData = JSON.parse(buffer)
	  	data = tmpData["results"]  
	  	tweets = []	

	  	for tweet in data
	  		h = {}
	  		h[:created_at] = tweet["created_at"]
	  		h[:from_user] = tweet["from_user"]
	  		h[:from_user_id] = tweet["from_user_id"]
	  		h[:from_user_name] = tweet["from_user_name"]
	  		h[:id] = tweet["id"]
	  		h[:profile_image_url] = tweet["profile_image_url"]
	  		h[:source] = tweet["source"]
	  		h[:text] = tweet["text"]
	  		tweets << h
	  	end
	  	
	  	return tweets
	end

	def self.getPagesFromCategory(category)
	end

	def self.getPages(search)
	end

	def self.getPageContent(page)
	end

	def self.getPageContentUrl(page)
	end

end
