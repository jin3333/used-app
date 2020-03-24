class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(9)
    @introduce = @user.introduce
  end
  
  def index
  end
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit
  end

  def new
  end

  def create
  end



  private
  def update_params
   params.require(:user).permit(:image,:introduce,:age,:sex)
  end

  def user_params
    params.require(:user).permit(:name, :email,:password, :password_confirmation, :image,:introduce,:age,:sex)
  end
end

