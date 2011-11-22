class SearcherController < ApplicationController

	def index
	end

	def results
		search = params[:searcher][:search].gsub(/\s/, '%20')

		wikiCategories = WikiConnectorController::getCategories(search)
		categories = formatWikiCategories(wikiCategories)

		@results = loopOverCategories(categories)
		@tweets = ConnectorController::getTweets(search)
	end

	def formatWikiCategories(wikiCategories)
		categories = []
		wikiCategories.map{ |wikiCategory|
			categories << wikiCategory[:category]
		}
		return categories
	end

	def loopOverCategories(categories)
		results= []

		categories.map{ |category|
			category = category.gsub(/\s/, '%20')
			logger.debug "CAT: " + category
			tmpPages = WikiConnectorController::getPagesFromCategory(category)

			subcategories, pages = loopOverPages(tmpPages)

			results << {:category => category, :pages => pages, :subcategories => subcategories}
		}
	end

	def loopOverPages(pagesCollection)
		pages = []
		categories = []
		subcategories = []

		pagesCollection.map{ |page|
			title = page[:title]
			titleArray = title.split(':')
			if titleArray[0] == "Category"
				categories << titleArray[1]
			else
				logger.debug "TITTLE: " + title
				pages << title
			end
		}

		#subcategories = loopOverCategories(categories)
		return [subcategories, pages]
	end

end
