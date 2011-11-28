class ChangeVotes < ActiveRecord::Migration
  
  def change
  		remove_column :idea_resource_votes, :idea_id
  		remove_column :user_idea_votes, :idea_id
  		add_column :idea_resource_votes, :idea_resource_id, :integer
  		add_column :user_idea_votes, :user_idea_id, :integer
  end

end
