class SessionsController < ApplicationController

  def create
    username = params[:user][:username]
    password = params[:user][:password]
    user = User.find_by_credentials(username, password)
    if user
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else
      flash.now[:errors] << "Incorrect combo"
      render :new
    end
  end

  def new
    @user = User.new
  end


end
