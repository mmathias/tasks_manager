class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private
  def current_user
    # @current_user = @current_user || @current_user = .....
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def redirect_logged_users
    redirect_to(tasks_path) if logged_in?
  end

  def require_logged_user
    redirect_to(login_path) unless logged_in?
  end
end
