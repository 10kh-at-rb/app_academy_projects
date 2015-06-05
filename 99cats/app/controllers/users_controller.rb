class UsersController < ApplicationController
  before_action :redirect_if_signed_in, only: [:new, :create]

  def create
    @user = User.create(user_params)
    if @user.valid?
      log_in!
    else
      flash.now[:errors] = @user.errors.full_messages
      render 'new'
    end
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
