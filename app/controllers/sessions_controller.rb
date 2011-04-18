class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:session][:username],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Password does not match username"
      render 'new'
    else
      sign_in user
      redirect_to user_tweets_url(:username => user.username)
    end
  end

  def new
    redirect_to user_tweets_url(:username => current_user.username) unless current_user.nil?
  end

  def destroy
    sign_out
    redirect_to root_path
  end
  

end
