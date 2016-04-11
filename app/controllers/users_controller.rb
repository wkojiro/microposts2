class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update,:destroy]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "update done!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    if @user.delete
      flash[:success] = "delete done!"
      redirect_to root_path
    else
      redirect_to @user
    end
    
  end
  
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:profile,:area,:password,:password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
