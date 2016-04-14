class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
        @favpost = Micropost.find(params[:micropost_id])
        current_user.favorite(@favpost)
        #modelにメソッドが書いてあるけどこれをここに書いてもいいのかな
         redirect_to current_user
    end
    
    def destroy
#        @micropost  = current_user.following_relationships.find(params[:id]).followed
        @favpost  = current_user.favorite.find(params[:micropost_id]).favorite      
        current_user.unfavorite(@favpost)
         redirect_to current_user        
    end
    
end

