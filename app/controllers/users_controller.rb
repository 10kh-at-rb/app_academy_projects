class UsersController < ApplicationController

  def create
    @user = User.create!(user_params)
    log_in!
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
