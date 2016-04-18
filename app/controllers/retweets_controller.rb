class RetweetsController < ApplicationController
   before_action :logged_in_user   
    def create
        @retpost = Micropost.find(params[:id])        
        current_user.retweet(@retpost) 
        redirect_to request.referrer || root_url            
    end

    def destroy
        @retpost = Micropost.find(params[:id])   
        @unretpost = current_user.retweets.where(retweetpost_id: @retpost.id) 
        Retweet.find(@unretpost[0]).destroy   
        redirect_to request.referrer || root_url            
    end
    
end
