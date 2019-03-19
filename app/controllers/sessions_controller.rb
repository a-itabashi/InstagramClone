class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.authenticate(params[:user][:password])

    else
      render 'new'
    end
  end

  def destroy
  end
end
