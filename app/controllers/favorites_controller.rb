class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end

  def destroy
    # Favorite.delete_all(["user_id = ? AND topic_id = ?",current_user.id, params[:topic_id]])
    if Favorite.where(user_id: current_user.id).where(topic_id: params[:topic_id]).delete_all > 0 then
      redirect_to topics_path, success: 'お気に入りを取り消しました'
    else
      redirect_to topics_path, danger: 'お気に入りを取り消しに失敗しました'
    end

  end

end
