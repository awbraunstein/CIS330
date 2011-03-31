class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:session][:username],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Password does not match username"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def new
  end

  def destroy
    sign_out
    redirect_to root_path
  end
  

end
