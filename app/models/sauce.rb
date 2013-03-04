class Sauce < ActiveRecord::Base
  has_many :cites
  attr_accessible :author, :title, :year, :mendeley_id
end
