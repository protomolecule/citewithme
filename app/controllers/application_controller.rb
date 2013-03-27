class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

    def render_404
      respond_to do |format|
        format.html { render :action => "404.html.erb", :status => 404 }
        # and so on..
      end
    end
    
    def about
      respond_to do |format|
        format.html { render :action => "about.html.erb" }
        # and so on..
      end
      
    end
end
