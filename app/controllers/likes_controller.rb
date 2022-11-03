class LikesController < ApplicationController

	def create
    @like = current_user.likes.new(article_id: params[:article_id])

    redirect_to @like.article if @like.save
  end

  def destroy
    @like = Like.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    @like.destroy
    redirect_to @like.article
  end
end
