class CreateSauces < ActiveRecord::Migration
  def change
    create_table :sauces do |t|
      t.string :author
      t.string :title
      t.string :year
      t.integer :mendeley_id
      t.timestamps
    end
  end
end
