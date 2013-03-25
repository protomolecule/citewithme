class Sauce < ActiveRecord::Base
  belongs_to :user
  has_many :cites
  attr_accessible :author, :title, :year, :mendeley_id, :user_id
  paginates_per 10
end
