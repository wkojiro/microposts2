class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
       # binding.pry
        @favpost = Micropost.find(params[:favpost_id])
        current_user.favorite(@favpost)
        #modelにメソッドが書いてあるけどこれをここに書いてもいいのかな
        #save なりが無いと保存しようがない？Find_by_or_createがあるからいいのか？
        redirect_to current_user
    end
    
    def destroy
#        binding.pry
#        @micropost  = current_user.following_relationships.find(params[:id]).followed
        @favrite = Favorite.find(params[:id])    
        current_user.unfavorite(@favrite)
        redirect_to current_user        
    end
    
end

