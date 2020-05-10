class OpinionsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @opinions = current_user.network_tweets.includes(:author).paginate(page: params[:page])
  end


  def foreign
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      flash[:sucess] = 'Your opinion was created successfully!'
    else
      flash[:danger] = 'Your opinion could not be created'
    end
    redirect_back fallback_location: '/'
  end


  private
    def opinion_params
      params.require(:opinion).permit(:text)
    end
end
