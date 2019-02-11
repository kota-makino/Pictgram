class CommentsController < ApplicationController
  def index

  end

  def new

    @comment = Comment.new
#＠commentはインスタンス変数
  end

  def create
    comment = Comment.new(comment: params[:comment][:comment])
    comment.user_id = current_user.id
    comment.topic_id = params[:comment][:topic_id]

    if comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      redirect_to topics_path, danger: 'コメントの投稿に失敗しました'
    end
  end
end
