class AddUserToCites < ActiveRecord::Migration
  def change
    change_table :cites do |t|
      t.belongs_to :user
    end
  end
end
