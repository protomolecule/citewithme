class CreateCites < ActiveRecord::Migration
  def change
    create_table :cites do |t|
      t.text :content
      t.string :sauce_id
      t.string :page

      t.timestamps
    end
  end
end
