class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    flash[:success] = "この投稿をお気に入りに登録しました"
    redirect_to post_path(favorite.post.id)
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:danger] = "この投稿のお気に入りを解除しました"
    redirect_to post_path(favorite.post.id)
  end
end
