# encoding: UTF-8
class CitesController < ApplicationController
  # GET /cites
  # GET /cites.json
  def index
    @cites = current_user.cites.all.reverse
    @cite = Cite.new
    @myvar = "That's how it works:"
    @hashtags = []
    @cites.each  do |c| 
      if c.content.include?("#")
        ht = c.content.scan(/#([a-züöäÜÖÄßA-Z0-9_]+)/)
        ht.each {|h| @hashtags.push(h).uniq!}

 #       @hashtags.push(c.content.scan(/#([a-zA-Z0-9_]+)/))
      end  
    end  
      
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cites }
    end
  end

  def hashtagindex
    # Variable for the search string
    @hashtag = params[:search]
    # Fills variable with %23hashtag instead of #hashtag for URLs
    @ashtag = @hashtag
    if @ashtag.start_with?("#")
      @ashtag = '%23' + @ashtag[1..-1]
    end  
    #actual search:
    @cites = Cite.search(params[:search], current_user)
  
    #Cite.where(['content LIKE ? AND  == ?', search_condition, ])
    # Container for sources that are sited in the search result
    @sources_cited = []
    # Add sources to container 
    @cites.each do |c|
      @sources_cited.push(Sauce.find(c.sauce_id)).uniq!
    end

#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @cites }
#    end
  end    
  
   

  # GET /cites/1
  # GET /cites/1.json
  def show
    @cite = current_user.cites.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cite }
    end
  end

  # GET /cites/new
  # GET /cites/new.json
  def new
    @cite = Cite.new(:user_id => current_user)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cite }
    end
  end

# Nach Tutorial:
#  def ajaxcreate  
#    @cite = current_user.cites.new(params[:cite], :user_id => current_user)
#    
#    # Irgendwie muss die neue ID zurück geschickt werden!!!
#    
#    respond_to do |format|
#      if @cite.save
#      else
#        format.html { redirect_to(cites_url) }
#      end
#    end
#  end
  
  
  # GET /cites/1/edit
  def edit
    @cite = current_user.cites.find(params[:id])
    @sauce = current_user.sauces.find(@cite.sauce_id)
  end

  # POST /cites
  # POST /cites.json
  #def create
  #  @cite = current_user.cites.new(params[:cite])

   # respond_to do |format|
    #  if @cite.save
     #   #format.html { redirect_to @cite, notice: 'Cite was successfully created.' }
      #  format.json { render json: @cite, status: :created, location: @cite }
      #else
       # format.html { render action: "new" }
        #format.json { render json: @cite.errors, status: :unprocessable_entity }
    #  end
    #end
#  end

  # PUT /cites/1
  # PUT /cites/1.json
  def update
    @cite = current_user.cites.find(params[:id])

    respond_to do |format|
      if @cite.update_attributes(params[:cite])
        backpath = "/sauces/" + @cite.sauce_id
            if @cite.content.include?("#")  
            @hts = @cite.content.scan(/#([a-züöäÜÖÄßA-Z0-9_-]+)/).flatten 
            @hts.each do |h|
              h = "\#" + h
        #      f = Htag.new(:name => h, :user_id => current_user)
        #      f = current_user.htags.where(:name => h).first_or_create
              f = current_user.htags.find_or_create_by_name(h)
             # f.save
            end  
            end
        format.html { redirect_to backpath, notice: 'Cite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cites/1
  # DELETE /cites/1.json
  def destroy
    
    @cite = current_user.cites.find(params[:id])
    @cite.destroy
    
    
    

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # GET /createcites
  def createcites
    @cite = current_user.cites.new(params[:cite])
    if @cite.content.include?("#")  
    @hts = @cite.content.scan(/#([a-züöäÜÖÄßA-Z0-9_-]+)/).flatten 
    @hts.each do |h|
      h = "\#" + h
#      f = Htag.new(:name => h, :user_id => current_user)
#      f = current_user.htags.where(:name => h).first_or_create
      f = current_user.htags.find_or_create_by_name(h)
     # f.save
    end  
    end
    respond_to do |format|
      if @cite.save
        
        format.json { render json: @cite, status: :created } 
      else
        format.html { render action: "new" }
        format.json { render json: @cite.errors, status: :unprocessable_entity }
      end
    end
  end  
  
end
