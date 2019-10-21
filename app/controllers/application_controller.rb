class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:id]) if session[:id]
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please Log In"
      redirect_to new_user_path
    end
  end

  def logged_in?
    !current_user.nil?
  end


  helper_method :current_user
end
