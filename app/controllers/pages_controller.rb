class PagesController < ApplicationController
  
  # GET /dresses/about
  def about
  end
  # GET /dresses/contact
  def contact
  end
  
  def search  
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @results = Dress.perform_search(params[:search])
    end  
  end
end
