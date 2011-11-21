require 'open-uri'
require 'json'

class WikiConnectorController < ApplicationController

	#Reference: http://www.ibm.com/developerworks/web/library/x-phpwikipedia/index.html
	#http://dev.storify.com/api/summary

	CMLIMIT = 100

	def self.getCategories(search)
	  	buffer = open("http://en.wikipedia.org/w/api.php?action=query&list=allcategories&acprefix=#{search}&format=json").read
	  	tmpData = JSON.parse(buffer)

	  	data = tmpData["query"]["allcategories"]
	  	categories = []	

	  	for item in data
	  		h = {}
	  		h[:category] = item["*"]
	  		categories << h
	  	end
	  	
	  	return categories
	end

	def self.getPagesFromCategory(category)
	  	buffer = open("http://en.wikipedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:#{category}&cmlimit=#{CMLIMIT}&format=json").read
		tmpData = JSON.parse(buffer)

	  	data = tmpData["query"]["categorymembers"]
	  	pagesAndSubcategories = []	

	  	for item in data
	  		h = {}
	  		h[:pageid] = item["pageid"]
	  		h[:ns] = item["ns"]
	  		h[:title] = item["title"] #May have 'Category:', so it needs a recursive function
	  		pagesAndSubcategories << h
	  	end
	  	
	  	return pagesAndSubcategories
	end

	def self.getPages(search)
	  	buffer = open("http://en.wikipedia.org/w/api.php?action=query&list=search&srwhat=text&srsearch=#{search}&format=json").read
	  	tmpData = JSON.parse(buffer)

	  	data = tmpData["query"]
	  	pages = []	

	  	totalHits = data["searchinfo"]["totalhits"]
	  	#nextResults = data["query-continue"]["search"]["sroffset"]

	  	for item in data["search"]
	  		h = {}
	  		h[:ns] = item["ns"]
	  		h[:title] = item["title"] 
	  		h[:snippet] = item["snippet"] 
	  		h[:size] = item["size"] 
	  		h[:wordcount] = item["wordcount"] 
	  		h[:timestamp] = item["timestamp"] 
	  		pages << h
	  	end

	  	return pages
	end

	def self.getPageContent(page)
	  	buffer = open("http://en.wikipedia.org/w/api.php?action=query&prop=revisions&rvprop=content&redirects=1&titles=#{page}&format=json").read
	end

end
