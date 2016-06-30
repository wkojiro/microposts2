class RetweetsController < ApplicationController
    before_action :logged_in_user    
#               retweets POST   /retweets(.:format)                 retweets#create
#        new_retweet GET    /retweets/new(.:format)             retweets#new
#            retweet DELETE /retweets/:id(.:format)             retweets#destroy
    def new
    end
    


#    def create
#        @user = User.find(params[:followed_id])
#        current_user.follow(@user)
        #modelにメソッドが書いてあるけどこれをここに書いてもいいのかな
#    end
    
#    def destroy
#        @user = current_user.following_relationships.find(params[:id]).followed
#        current_user.unfollow(@user)
#    end
    
    
    
    
    
    def create
   #      binding.pry 
    #     @retweets = Retweet.new(retweet_params)
      
         @retweets= current_user.retweets.build(retweet_params)
#         @retweets.save
         puts @retweets.inspect        
#         current_user.retweet(@retweets)
          @retweets.save 
         @micropost = Micropost.find(@retweets[:retweetpost_id])
          puts @micropost.inspect

#        if @retweets.save
 #           flash[:success] = "Retweet created!"
 #           redirect_to root_url
#        else
 #         puts @retweets.inspect
   
            #これでいいのか？？
 #           flash[:success] = "Retweet not created!"        
 #           @user = current_user
 #           @micropost = current_user.microposts.build
 #           @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
 #           redirect_to request.referrer || root_url  
#        end
         
    end
 
   def show

   end
 
 
 
    def destroy
       # retweet DELETE /retweets/:id(.:format)             retweets#destroy
 #   binding.pry    
##パラメータにはRetweetのIDが入っている。
  #  @retweet = current_user.retweets.find_by(id: params[:id])



   @retweet = current_user.retweets.find(params[:id])
##削除すべきレコードを@retweetにぶち込んで削除する。 
 # @micropost = Micropost.where(id: @retweet[:retweetpost_id])
  current_user.unretweet(@retweet)
  @micropost = Micropost.find_by(id: @retweet[:retweetpost_id])
 puts @micropost.inspect
    end
    
    private
      def retweet_params
        params.require(:retweet).permit(:retweetuser_id,:retweetpost_id,:retweetcontent)
      end

end

 #   def destroy
 #       @user = current_user.following_relationships.find(params[:id]).followed
 #       current_user.unfollow(@user)
 #   end