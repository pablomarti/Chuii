class CreateIdeaResources < ActiveRecord::Migration
  def change
    create_table :idea_resources do |t|
      t.integer :user_id
      t.integer :idea_id
      t.string :url
      t.integer :weight

      t.timestamps
    end
  end
end
