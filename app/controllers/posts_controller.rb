class PostsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      ContactMailer.contact_mail(@post).deliver
      flash[:success] = "投稿が完了しました"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorites= @post.favorite_users
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render 'new' if @post.invalid?
  end

  def edit
  end

  def update
    @post.update(post_params)
    flash[:success] = "投稿が編集されました"
    redirect_to posts_path
  end

  def destroy
    @post.destroy
    flash[:info] = "投稿が削除されました"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :post_image, :post_image_cache)
  end

  def set_params
     @post = Post.find(params[:id])
  end

end
