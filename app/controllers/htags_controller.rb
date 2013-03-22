class HtagsController < ApplicationController
  # GET /htags
  # GET /htags.json
  def index
    my_htags = current_user.htags
    @tags_with_count = Hash.new()
    my_htags.each do |ht|
      cites_with_tag = Htag.search(ht.name, current_user)
      @tags_with_count[ht.name] = cites_with_tag.count
    end  
  end
  
end