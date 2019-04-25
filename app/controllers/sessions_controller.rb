class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if !user || !user.authenticate(params[:session][:password])
      session.delete(:user_id)
      flash.now[:info] = "もう一度入力し直してください。"
      render 'new'
    end
    session[:user_id] = user.id
    flash[:success] = "ログインしました"
    redirect_to posts_path
  end

  def destroy
    session.delete(:user_id)
    flash[:info] = "ログアウトしました"
    redirect_to root_path
  end
end
