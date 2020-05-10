class UsersController < ApplicationController
  before_action :user_opinions,  only:  %i[show following followers]

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
    @view_type = 'opinions'
  end

  def following
    @users = @user.followed_user.paginate(page: params[:page])
    @view_type = 'following'
    render  :show
  end

  def followers
    @users = @user.followers.paginate(page: params[:page])
    @view_type = 'followers'
    render :show
  end
  
  private

    def user_params
      params.require(:user).permit(:username, :fullname, :photo, :coverimage)
    end

    def user_opinions
      @user = User.find(params[:id])
      @opinions = current_user.network_tweets.includes(:author).paginate(page: params[:page])
    end
end
