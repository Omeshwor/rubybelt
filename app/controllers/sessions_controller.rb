class SessionsController < ApplicationController
  before_action :logged_in_user, except: [:new, :create, :destroy]
  def new

  end

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      # log_in user
      session[:id] = user.id
      current_user = user
      flash[:success] = "successfully logged in"
      redirect_to songs_path
    else
      flash[:errors] = "Invalid Combination"
      redirect_to new_user_path
    end
  end

  def destroy
    session.clear
    flash[:success] = "Succesfully Logged Out"
    redirect_to new_user_path
  end
end
