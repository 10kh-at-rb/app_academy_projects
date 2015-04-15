class SessionsController < ApplicationController

  def create
    log_in!
  end

  def new
    @user = User.new
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to root_url
  end


end
