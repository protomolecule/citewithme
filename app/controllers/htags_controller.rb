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
    @tags_with_count = @tags_with_count.sort_by { |name, cou| name }  
  end
  
  # NOT IN USE:
  def create_htags
    new_htag = params[:name]
    @ht = current_user.htags.where(:name => new_htag).first_or_create
    @ht.save
    respond_to do |format|
      if @ht.save
        format.json { render json: @ht, status: :created } 
      else
        format.html { render action: "new" }
        format.json { render json: @ht.errors, status: :unprocessable_entity }
      end
    end
  end
  
end