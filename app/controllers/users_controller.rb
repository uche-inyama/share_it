class UsersController < ApplicationController
 def index 
 end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to opinions_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @opinions = current_user.network_tweets.includes(:author).paginate(page: params[:page])
  end

  private

    def user_params
      params.require(:user).permit(:username, :fullname, :photo, :coverimage)
    end
end
