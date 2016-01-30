class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to login_path, :alert => exception.message
  end

  private
  def current_user
    @user ||= Student.find(session[:id]) if session[:id]
  rescue ActiveRecord::RecordNotFound
    session.delete(:id)
  end
end
