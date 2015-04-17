class SessionsController < ApplicationController

  def create
    username = params[:user][:username]
    password = params[:user][:password]
    @user = User.find_by_credentials(username, password)
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Incorrect Username/Password Combination"]
      render 'new'
    end
  end

  def new
    render :new
  end

end
