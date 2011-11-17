class UserIdeasRemoveCommentId < ActiveRecord::Migration
  def up
  	remove_column :user_ideas, :comment_id
  end

  def down
  	add_column :user_ideas, :comment_id, :integer, :default => 0
  end
end
