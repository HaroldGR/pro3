class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
          @micropost = Micropost.new
          @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contactar"
  end
  
  def about
    @title = "Acerca de nosotros"
  end
  
  def help
    @title = "Ayuda"
  end

end
