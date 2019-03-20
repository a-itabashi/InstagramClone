class PostsController < ApplicationController
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
      flash[:success] = "投稿が完了しました"
      redirect_to posts_path
    else
      render 'new'
    end

  end

  def confirm
    @post = current_user.posts.build(post_params)
    render 'new' if @post.invalid?
  end

  def edit
  end

  def update
  end

  def post_params
    params.require(:post).permit(:title, :content, :post_image, :post_image_cache)
  end

end
