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
         @favpost = Micropost.find(params[:id])        
        current_user.favorite(@favpost) 
        flash[:success] = "good!"
        redirect_to request.referrer || root_url         
#        controller_name = controller_name
#         if controller_name == static_pages
#          redirect_to root_path
#         elsif controller_name == users
#          redirect_to @user
#         end
    end
    
    
    def unfav
 #       binding.pry
        @favpost = Micropost.find(params[:id])   
        @unfavpost = current_user.favorites.where(favpost_id: @favpost.id) 
         Favorite.find(@unfavpost[0]).destroy
#       @unfavpost = current_user.favorites.find_by(favpost_id: params[:id])
#       puts @unfavpost
#       @unfavpost = Micropost.find(params[:id])   

#        current_user.unfavget(@ids)
 #       puts @unfavpost
        redirect_to request.referrer || root_url 
#        controller_name = controller_name
#         if controller_name == static_pages
#          redirect_to root_path
#         elsif controller_name == users
#          redirect_to @user
#         end
    end
    
    
end
