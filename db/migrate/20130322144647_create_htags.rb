class CreateHtags < ActiveRecord::Migration
    def change
      create_table :htags do |t|
        t.string :name
        t.belongs_to :user
        t.timestamps
      end
    end
  end
