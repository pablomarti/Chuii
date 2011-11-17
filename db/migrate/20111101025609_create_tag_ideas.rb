class CreateTagIdeas < ActiveRecord::Migration
  def change
    create_table :tag_ideas do |t|
      t.integer :idea_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
