class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    redirect_to user_url(@user)
  end

  def new
    @user = User.new
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
