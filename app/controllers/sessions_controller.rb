class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      log_in user
      flash[:success] = 'You have successfully signed in'
      redirect_to opinions_path
    else
      flash[:danger] = 'Invalid username'
      redirect_to new_user_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
