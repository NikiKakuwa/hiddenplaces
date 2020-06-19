class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
       redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       # flash[:success] = 'ユーザー情報が更新されました！'
       redirect_to user_path(@user)
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
    @user = current_user
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
  end

end
