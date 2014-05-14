class CommentsController < ApplicationController
  before_action :authorize!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:body).merge(user_id: current_user.id))
    redirect_to post_path(@post)
  end

  def new
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
  end
end