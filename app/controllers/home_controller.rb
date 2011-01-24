class HomeController < ApplicationController
  def index
    @title = "Home"
    if signed_in?
          @micropost = Micropost.new
          @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end
end