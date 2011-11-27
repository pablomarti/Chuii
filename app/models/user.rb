class User < ActiveRecord::Base

	belongs_to :country
	belongs_to :job
	has_many :ideas, :dependent => :destroy
	has_many :user_ideas, :dependent => :destroy
	has_many :favorite_ideas, :dependent => :destroy
	has_many :idea_resources, :dependent => :destroy

	#Valorations
	has_many :user_idea_votes, :dependent => :destroy
	has_many :idea_votes, :dependent => :destroy
	has_many :idea_resource_votes, :dependent => :destroy

	def fullName
		name + " " + lastname
	end

	def suggestedIdeas
	end

	def favoriteIdeas
		favorite_ideas.collect{ |favoriteIdea| favoriteIdea.idea }
	end

	def popularIdeas
		#ideas
	end

	def favoriteIdeas
		ideas = []
		favorite_ideas.order("id DESC").map{ |favoriteIdea|
			ideas << favoriteIdea.idea
		}
		return ideas
	end

	def recentIdeas
		ideas.order("id DESC")
	end

	def hasInFavorites(idea)
		FavoriteIdea.where(:user_id => id, :idea_id => idea.id).first rescue nil
	end

	def removeFromFavorites(idea)
		fi = FavoriteIdea.where(:user_id => id, :idea_id => idea.id).first rescue nil
		if !fi.nil?
			fi.destroy
		end		
	end

	def addToFavorites(idea)
		fi = FavoriteIdea.where(:user_id => id, :idea_id => idea.id).first rescue nil
		if fi.nil?
			fi = FavoriteIdea.new({:user_id => id, :idea_id => idea.id})
			fi.save!
		end		
	end

end
