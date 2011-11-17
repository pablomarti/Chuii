class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title, :null => false, :limit => 100
      t.timestamps
    end
  end
end
