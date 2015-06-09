class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def redirect_nonauthor
    if Post.find(params[:id]).author_id != current_user.id
      flash[:errors] = ["You are not the author of this post"]
      redirect_to post_url(params[:id])
    end
  end

  def redirect_nonmoderator
    if Sub.find(params[:id]).moderator_id != current_user.id
      flash[:errors] = ["You are not the moderator of this sub"]
      redirect_to sub_url(params[:id])
    end
  end


  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end

end
