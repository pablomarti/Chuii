class AddCategories1 < ActiveRecord::Migration
	
  def up
  	Category.create!({:category => "Web"})
  	Category.create!({:category => "Software"})
  	Category.create!({:category => "Cars"})
  	Category.create!({:category => "Energy"})
  	Category.create!({:category => "Art"})
  	Category.create!({:category => "Story"})
  	Category.create!({:category => "Politics"})
  	Category.create!({:category => "Religion"})
  	Category.create!({:category => "Music"})
  	Category.create!({:category => "Philosophy"})
  	Category.create!({:category => "Design"})
  	Category.create!({:category => "Social Network"})
  	Category.create!({:category => "Kitchen"})
  	Category.create!({:category => "Farming"})
  	Category.create!({:category => "Culture"})
  	Category.create!({:category => "Games"})
  	Category.create!({:category => "Science"})
  	Category.create!({:category => "Fashion"})
  	Category.create!({:category => "Other"})
  end

  def down
  end

end
