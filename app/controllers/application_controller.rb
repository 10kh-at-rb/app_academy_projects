class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil unless session[:session_token]
    User.find_by(session_token: session[:session_token])
  end

  def log_in!
    username = params[:user][:username]
    password = params[:user][:password]
    user = User.find_by_credentials(username, password)
    if user
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else
      flash.now[:errors] = "Incorrect combo"
      render :new
    end
  end

end
