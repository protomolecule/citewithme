class Htag < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :user_id
  def self.search(search, user)
    search_condition = "%" + search + "%"
    Cite.all(:conditions => ['content LIKE ? AND user_id == ?', search_condition, user])
  end
  
end

