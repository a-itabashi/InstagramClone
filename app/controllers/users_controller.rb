class UsersController < ApplicationController
  before_action :set_params, only:[:edit, :show, :update, :destroy]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "新規登録が完了しました"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.authenticate(params[:user][:password])
      @user.update(user_params)
      flash[:success] = "プロフィールを編集しました"
      redirect_to user_path(@user.id)
    else
      flash.now[:info] = "ご自身のパスワードをもう一度入力してください"
      render 'edit'
    end

  end

  def destroy
    @user.destroy
    session.delete(:user_id)
    flash[:info] = "今までありがとうございました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image, :user_image_cache)
  end

  def set_params
    @user = User.find(params[:id])
  end
end
