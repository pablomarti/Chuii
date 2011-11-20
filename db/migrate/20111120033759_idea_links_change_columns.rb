class IdeaLinksChangeColumns < ActiveRecord::Migration
  def up
  		remove_column :idea_links, :idea_link_id
  		add_column :idea_links, :parentlink_id, :integer, :default => 0
  end

  def down
  		add_column :idea_links, :idea_link_id, :integer, :default => 0
  		remove_column :idea_links, :parentlink_id
  end
end
