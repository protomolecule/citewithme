class Sauce < ActiveRecord::Base
  belongs_to :user
  has_many :cites
  attr_accessible :author, :title, :year, :mendeley_id, :user_id
end
