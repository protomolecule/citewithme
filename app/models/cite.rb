class Cite < ActiveRecord::Base
  belongs_to :sauce
  belongs_to :user
  attr_accessible :content, :sauce_id, :page, :user_id
  
  searchable :auto_index => true, :auto_remove => true do
      text :content
 #     string :page
      integer :sauce_id
      integer :user_id
 #     time    :created_at
    end
  
  
#  def self.search(search, user)
#    #users_sauces = current_user.sauces
#    search_condition = "%" + search + "%"
#    #find(:all, :conditions => ['content LIKE ?', search_condition])
#    Cite.all(:conditions => ['content LIKE ? AND user_id == ?', search_condition, user])
#  end
end

