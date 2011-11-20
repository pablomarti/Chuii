class CreateTagIdeaLinks < ActiveRecord::Migration
  def change
    create_table :tag_idea_links do |t|
      t.integer :tag_id
      t.integer :idea_link_id

      t.timestamps
    end
  end
end
