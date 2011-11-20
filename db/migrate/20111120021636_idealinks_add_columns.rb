class IdealinksAddColumns < ActiveRecord::Migration
  def up
  		add_column :idea_links, :source_id, :integer
  		add_column :idea_links, :sourcekind_id, :integer
  		add_column :idea_links, :idea_link_id, :integer, :default => 0
  end

  def down
  		remove_column :idea_links, :source_id
  		remove_column :idea_links, :sourcekind_id
  		remove_column :idea_links, :idea_link_id
  end
end
