class CreateUserIdeas < ActiveRecord::Migration
  def change
    create_table :user_ideas do |t|
	  t.references :user
	  t.references :idea
	  t.integer :comment_id, :default => 0
      t.integer :weight, :default => 0
      t.text :comment
      t.timestamps
    end
  end
end
