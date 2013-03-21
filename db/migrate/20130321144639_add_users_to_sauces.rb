class AddUsersToSauces < ActiveRecord::Migration
  def change
    change_table :sauces do |t|
      t.belongs_to :user
    end
  end
end
