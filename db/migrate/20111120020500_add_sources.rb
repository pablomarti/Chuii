class AddSources < ActiveRecord::Migration
  def up
  		Source.create!({:name => "Twitter"})
  		Source.create!({:name => "Wikipedia"})
  		Source.create!({:name => "Google"})
  end

  def down
  end
end
