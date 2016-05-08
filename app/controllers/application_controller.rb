class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_current_user

  def set_current_user
    @current_user = User.find(session[:current_user_id]) if session[:current_user_id].present?
  end

  def require_login
    redirect_to(
      sessions_path, flash: { notice: "Please login first."}
    ) unless @current_user
  end
end
