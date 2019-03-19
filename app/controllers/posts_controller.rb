class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
  end

  def confirm
  end

  def edit
  end

  def update
  end

end
