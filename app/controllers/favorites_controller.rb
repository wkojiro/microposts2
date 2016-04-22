class FavoritesController < ApplicationController
    before_action :logged_in_user

## POST 用メソッド###
 #   def create
       # binding.pry
 ##POST 
 #       @favpost = Micropost.find(params[:favpost_id])
 #       @favpost = Micropost.find(params[:id])        
 #       current_user.favorite(@favpost)
        #modelにメソッドが書いてあるけどこれをここに書いてもいいのかな
        #save なりが無いと保存しようがない？Find_by_or_createがあるからいいのか？
 #      redirect_to root_path
 #   end
 #   
 #   def destroy
#        binding.pry
#        @micropost  = current_user.following_relationships.find(params[:id]).followed
 #       @favrite = Favorite.find(params[:id])    
 #       current_user.unfavorite(@favrite)
 #    redirect_to root_path        
 #   end
    
    
## GET 用メソッド###

    def fav
#    binding.pry    
        @micropost = Micropost.find(params[:id])  
        current_user.favorite(@micropost)
    end
    
    
    def unfav
        @unfavpost = current_user.favorites.where(favpost_id: params[:id])
        current_user.unfavorite(@unfavpost)
        ## ajax（js）に値を返すために下記の処理を追加　DEPRECATION WARNINGが出てしまっている。
         @micropost = Micropost.find(params[:id])
    end
    
end
