class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
    current_user
  end

  def logged_in?
    session[:session_token] == current_user.session_token
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_out
    return if current_user.nil?
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
