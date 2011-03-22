class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:session][:username],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Password does not match username"
      render 'new'
    end
  end

  def new
  end

end
