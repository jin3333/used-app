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
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(12)
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
    end
    @parents = Category.all.order("id ASC").limit(13)
    end

  def show
    @post = Post.find_by(id: params[:id])
    @text = @post.text
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
    @like = Like.new
  end
  
  def search
    @posts = Post.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(12)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

 def post_params
  params.require(:post).permit(:text, :image, :tag_list, :clothesinfo, :name, :brand, :price, :itemimag, :category_id,).merge(user_id: current_user.id )
 end

end
