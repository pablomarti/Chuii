class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category, :null => false, :limit => 100
      t.timestamps
    end
  end
end
