class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if session[:user_id] && session[:user_id]["type"] == Student.to_s
      @current_user ||= Student.find(session[:user_id]["id"])
    elsif session[:user_id] && session[:user_id]["type"] == Company.to_s
      @current_user ||= Company.find(session[:user_id]["id"])
    end
  end

  def require_user
    redirect_to login_path unless current_user
  end

  def require_student
    redirect_to login_path unless current_user && current_user.student?
  end

  def require_admin
    redirect_to root_path unless current_user && current_user.student? && current_user.admin?
  end

  def require_company
    redirect_to login_path unless current_user && current_user.company?
  end
end
