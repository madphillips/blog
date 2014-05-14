class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path, notice: "Welcome Back #{user.username}!"
    else
      flash.now[:alert] = "We couldn't find that user/password combination."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'You are now logged out.'
  end
end
