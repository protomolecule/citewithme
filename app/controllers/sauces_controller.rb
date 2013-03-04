class SaucesController < ApplicationController
  # GET /sauces
  # GET /sauces.json
  def index
    @sauces = Sauce.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sauces }
    end
  end

  # GET /sauces/1
  # GET /sauces/1.json
  def show
    @sauce = Sauce.find(params[:id])
    @cites = @sauce.cites.reverse
    @cite = Cite.new(:sauce_id => @sauce.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sauce }
    end
  end

  # GET /sauces/new
  # GET /sauces/new.json
  def new
    @sauce = Sauce.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sauce }
    end
  end

  # GET /sauces/1/edit
  def edit
    @sauce = Sauce.find(params[:id])
  end

  # POST /sauces
  # POST /sauces.json
  def create
    @sauce = Sauce.new(params[:sauce])

    respond_to do |format|
      if @sauce.save
        format.html { redirect_to @sauce, notice: 'Sauce was successfully created.' }
        format.json { render json: @sauce, status: :created, location: @sauce }
      else
        format.html { render action: "new" }
        format.json { render json: @sauce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sauces/1
  # PUT /sauces/1.json
  def update
    @sauce = Sauce.find(params[:id])

    respond_to do |format|
      if @sauce.update_attributes(params[:sauce])
        format.html { redirect_to @sauce, notice: 'Sauce was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sauce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sauces/1
  # DELETE /sauces/1.json
  def destroy
    @sauce = Sauce.find(params[:id])
    @sauce.destroy

    respond_to do |format|
      format.html { redirect_to sauces_url }
      format.json { head :no_content }
    end
  end
end
