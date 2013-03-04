class Cite < ActiveRecord::Base
  belongs_to :sauce
  attr_accessible :content, :sauce_id, :page
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['content LIKE ?', search_condition])
  end
end

