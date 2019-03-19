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

  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image, :user_image_cache)
  end

  def set_params
    @user = User.find(params[:id])
  end
end
