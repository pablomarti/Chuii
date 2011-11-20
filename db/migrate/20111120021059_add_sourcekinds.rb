class AddSourcekinds < ActiveRecord::Migration
  def up
  		Sourcekind.create!({:name => "Article"})
  		Sourcekind.create!({:name => "Video"})
  		Sourcekind.create!({:name => "Tweet"})
  		Sourcekind.create!({:name => "Website"})
  end

  def down
  end
end
