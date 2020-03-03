class PostsController < ApplicationController
  before_action :move_to_index, except: :index

 def index
   @Post = Post.all
 end

 def new
   @post = Post.new
 end

 def create
   Post.create
 end

 def destroy
   post = Post.find(params[:id])
   post.delete
 end

 def edit
   @post = Post.find(params[:id])
 end

 def update
   post = Post.find(params[:id])
   post.update(question_params)
 end

 def move_to_index
   redirect_to action: :index unless user_signed_in?
 end


 private
 def post_params
   params.require(:post).permit(:theme)
 end
end
