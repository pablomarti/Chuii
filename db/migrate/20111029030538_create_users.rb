class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.references :country
      t.references :job
      t.string :name, :null => false
      t.string :lastname, :null => false
      t.datetime :birthday
      t.boolean :sex
      t.string :email
      t.text :bio
      t.integer :fb_id, :default => 0
      t.string :timezone, :default => ""
      t.string :fb_username, :default => ""
      t.string :fb_link, :default => ""
      t.integer :weight, :default => 1
      t.timestamps
    end
  end

end
