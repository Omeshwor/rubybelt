module SessionsHelper
  def current_user
    current_user = session[:id]
  end

end
