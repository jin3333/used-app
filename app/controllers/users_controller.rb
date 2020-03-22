class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @posts = user.posts
  end
  
  def index
  end
  def update
    current_user.update(update_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def update_params
   params.require(:user).permit(:image)
  end
end

