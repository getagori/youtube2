class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
   @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to :action => "index"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to :action => "index"
  end

  def destroy
    post = Post.find(params[:id])
    post.delete
    redirect_to :action => "index"
  end



  private
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end


end
