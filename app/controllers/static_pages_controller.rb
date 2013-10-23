class StaticPagesController < ApplicationController
 include SessionsHelper
  def home
    if signed_in?
      @micropost= current_user.microposts.build if signed_in?
      @feed_items=current_user.feed.paginate(page: params[:page])

    end

  end
  def index
    
  end
  
  def help
  end
  def about
    
  end
end
