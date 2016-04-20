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
#        @favpost = Micropost.find(params[:id])        
        current_user.favorite(@micropost)
#       flash[:success] = "good!"
#       redirect_to request.referrer || root_url         
#        controller_name = controller_name
#         if controller_name == static_pages
#          redirect_to root_path
#         elsif controller_name == users
#          redirect_to @user
#         end
    end
    
    
    def unfav
 #      binding.pry
 
#        @micropost = Micropost.find(params[:id])  
 #        @unfavpost = current_user.favorites.where(favpost_id: @micropost.id) 
        @unfavpost = current_user.favorites.where(favpost_id: params[:id])
  #      puts @micropost.inspect
        current_user.unfavorite(@unfavpost)
        
         @micropost = Micropost.find(params[:id])
 #       puts @micropost.inspect
   #     puts @unfavpost[2].inspect
#        puts @unfavpost.pluck(:id)
 #       puts "hi"
 #       @micropost = Micropost.find(params[:id])  
#        
#         Favorite.find(@unfavpost[0]).destroy
#         Favorite.find(@micropost[0]).destroy
         
#       @unfavpost = Micropost.find(params[:id])   

#        current_user.unfavget(@ids)
 #       puts @unfavpost
 #       redirect_to request.referrer || root_url 
#        controller_name = controller_name
#         if controller_name == static_pages
#          redirect_to root_path
#         elsif controller_name == users
#          redirect_to @user
#         end
    end
    
 #   def destroy
 #       @user = current_user.following_relationships.find(params[:id]).followed
 #       current_user.unfollow(@user)
 #   end    

end
