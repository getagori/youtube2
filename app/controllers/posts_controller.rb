class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(title: post_params[:title], content: post_params[:content], image: post_params[:image], user_id: current_user.id)
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

  def show
    @post = Post.find(params[:id])
  end

  def search
    post_search = PostSearch.new(params_post_search)
    @posts = post_search.execute
  end



  private
  def post_params
    params.require(:post).permit(:title, :content, :image, :user_id)
  end


  def params_post_search
    params.permit(:search_title)
  end

end
