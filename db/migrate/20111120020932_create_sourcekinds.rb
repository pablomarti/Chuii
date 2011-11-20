class CreateSourcekinds < ActiveRecord::Migration
  def change
    create_table :sourcekinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
