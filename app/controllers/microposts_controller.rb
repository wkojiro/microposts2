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
            #これでいいのか？？
            @micropost = current_user.microposts.build
            @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
            render 'static_pages/home'
        end
    end
    
    def destroy
#    binding.pry
    @micropost = current_user.microposts.find_by(id: params[:id])
  #  @micropost = current_user.microposts.find(params[:id])
    
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url    

    end
    
    def retweet
 #    binding.pry   
     @retweetpost = Micropost.find_by(id: params[:id])
     @retweetpost = current_user.microposts.build(:content => @retweetpost.content, :origin_id => @retweetpost.id)    
       if @retweetpost.save
            flash[:success] = "Retweet success!"
            redirect_to request.referrer || root_url
      else
            #新しい教材に載ってたので記載。（苦労したやつ）
            @user = current_user
            @micropost = current_user.microposts.build
            @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
            render 'static_pages/home' 
       end
    end    
    
    private
    def micropost_params
        params.require(:micropost).permit(:content,:origin_id)
    end
    
end
#       @retweetpost.attributes = {:origin_id => params[:id]}
#       @retweetposts.save
      
#      redirect_to request.referrer || root_url    

 ##retweet元のつぶやきをもってくる
 ##持ってきた記事のIDをorigin_idに格納する。
 ##それ以外はmicropost_paramsと同じ要領で格納する
  #   following_relationships.find_or_create_by(followed_id: other_user.id)