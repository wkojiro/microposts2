class MicropostsController < ApplicationController
    before_action :logged_in_user, only:[:create,:destroy]
    
    def create
        @microposts = current_user.microposts.build(micropost_params)
        if @microposts.save
            flash[:success] = "Microposts created!"
            redirect_to root_url
        else
            #新しい教材に載ってたので記載。（苦労したやつ）
            @user = current_user
            @micropost = current_user.microposts.build
            @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
            render 'static_pages/home'
        end
    end
    
    def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
  #  @micropost = current_user.microposts.find(params[:id])
    
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url    
    
    
    end
    
    def fav
     @fav = Micropost.find(params[:id])
     current_user.favorite(@fav)    
    end
    
    def unfav
     @unfav = Favorite.find(params[:id])    
     current_user.unfavorite(@unfav)        
    end
    
    def retweet
    end
    
    
    
    
    
    
    private
    def micropost_params
        params.require(:micropost).permit(:content)
    end
    
end
