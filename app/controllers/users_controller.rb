class UsersController < ApplicationController
  before_action :user_opinions,  only:  %i[show following followers]

  def index
    if current_user.nil?
      redirect_to login_path
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new
    set_meta_tags og: {
      image: 'https://unsplash.com/photos/OeXcIHFwtsM?utm_source=unsplash&utm_medium=referral&utm_content=creditShareLink',
    }
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You have successfully signed up."
      redirect_to opinions_path
    else
      flash.now[:error] = "Unsucccessful sign up."
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
      @opinions = current_user.opinions_list.includes(:author).paginate(page: params[:page])
    end
end
