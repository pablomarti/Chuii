class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.references :category
      t.references :user
      t.string :idea, :null => false
      t.string :short_description, :null => false
      t.text :long_description
      t.boolean :active, :default => true
      t.boolean :public, :default => true
      t.integer :weight, :default => 0
      t.timestamps
    end
  end
end
