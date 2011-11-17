class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country, :null => false, :limit => 75
      t.timestamps
    end
  end
end
