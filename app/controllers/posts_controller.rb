class PostsController < ApplicationController
  before_action :authorize!, except: [:index, :show]
  before_action :get_user, only: :index

  # GET /posts
  # GET /users/:user_id/posts
  def index
    @posts = post_scope.order(created_at: :desc)
  end

  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # CREATE /posts
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  # GET /posts/:id/edit
  def edit
    @post = current_user.posts.find(params[:id])
  end

  # PATCH /posts/:id
  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  # DELETE /posts/:id
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

private

  def get_user
    @user ||= User.find(params[:user_id]) if params[:user_id]
  end

  def post_scope
    @user ? @user.posts : Post.all
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
