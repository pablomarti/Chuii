class CreateUserIdeaVotes < ActiveRecord::Migration
  def change
    create_table :user_idea_votes do |t|
      t.integer :user_id
      t.integer :idea_id
      t.boolean :valoration

      t.timestamps
    end
  end
end
