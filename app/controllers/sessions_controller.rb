class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil    
  end
end
