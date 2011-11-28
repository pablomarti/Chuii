class Idea < ActiveRecord::Base

	belongs_to :user
	belongs_to :category
	has_many :user_ideas, :dependent => :destroy
	has_many :tag_ideas, :dependent => :destroy
	has_many :tags, :through => :tag_ideas
	has_many :favorite_ideas, :dependent => :destroy
	has_many :idea_links, :dependent => :destroy
	has_many :idea_resources, :dependent => :destroy
	has_many :idea_votes, :dependent => :destroy

	validates :idea, :presence => true
	validates :short_description, :presence => true
	validates :long_description, :presence => true

	define_index do
	      indexes idea
	      indexes short_description
	      indexes long_description
	      indexes category.category, :as => :category_name, :sortable => true
	      indexes tags.name, :as => :tag_name, :sortable => true
	      
	      has :id
	      has :category_id
	      has :active
	      has :public
	      has :weight, :sortable => true
	      has created_at, updated_at

	      where "ideas.active = 1 AND ideas.public = 1"
	      group_by "ideas.id"
  	end

  	def addTags(tags)
		tags.map{ |item|
			item = item.downcase
			
			tag = Tag.find_by_name(item)
			if tag.nil?
				tag = Tag.new({:name => item})
				tag.save
			end

			tagIdea = TagIdea.new({:tag_id => tag.id, :idea_id => id})
			tagIdea.save
		}
  	end

  	def updateTags(tags)
  		originalTags = TagIdea.where(:idea_id => id)
  		originalTags.map{ |tag|
  			tag.destroy
  		}

		tags.map{ |item|
			item = item.downcase
			
			tag = Tag.find_by_name(item)
			if tag.nil?
				tag = Tag.new({:name => item})
				tag.save
			end

			tagIdea = TagIdea.new({:tag_id => tag.id, :idea_id => id})
			tagIdea.save
		}
  	end

	def similarIdeas
		Idea.all
	end

	def self.latestIdeas
		where(:active => true, :public => true).order("id DESC").limit(15)
	end

	def self.topIdeas
		where(:active => true, :public => true).order("weight DESC").limit(15)
	end

	def self.simpleSearch(search, categoryId = 0, page = 1, perPage = 15)      
		if categoryId == 0
    	    ideas = Idea.search search, :star => true, :match_mode => :any, :page => page, :per_page => perPage, :with => {:active => true, :public => true}
    	    totalElements = Idea.search_count search, :star => true, :match_mode => :any, :with => {:active => true, :public => true}
		else
	        ideas = Idea.search search, :star => true, :match_mode => :any, :page => page, :per_page => perPage, :with => {:category_id => categoryId, :active => true, :public => true}
	        totalElements = Idea.search_count search, :star => true, :match_mode => :any, :with => {:category_id => categoryId, :active => true, :public => true}
		end

		return [ideas, totalElements, page, perPage]
	end
	
end
