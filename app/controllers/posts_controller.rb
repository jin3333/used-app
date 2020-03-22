class PostsController < ApplicationController
  def new 
    @post = Post.new
  end
  
  def create
    Post.create(post_params)
    @post = Post.new(post_params) 
    @post.user_id = current_user.id

  end

  def index
    @posts = Post.all
    @posts = Post.includes(:user)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def search
    @posts = Post.search(params[:keyword])
  end

  private

 def post_params
  params.require(:post).permit(:text, :image).merge(user_id: current_user.id)
 end
end
