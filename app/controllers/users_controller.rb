class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    redirect_to user_posts_path(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "Welcome #{@user.username}! Thanks for signing up!"
    else
      flash.now[:alert] = "There was a problem signing you up."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
