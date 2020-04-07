class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_article, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  
  def create
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user[:id]
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def correct_user
    @comment = @article.comments.find(params[:id])
    user = @comment.user
    redirect_to article_path(@article) unless current_user?(user) || current_user?(@article.user)
  end
end
