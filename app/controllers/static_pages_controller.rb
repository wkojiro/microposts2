class StaticPagesController < ApplicationController
  def home
    if logged_in?
#    @user = current_user
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed_items.includes(:user).page(params[:page]).per(10).order(created_at: :desc)
    @retweet = current_user.retweets.build

    end
    
  end
end
