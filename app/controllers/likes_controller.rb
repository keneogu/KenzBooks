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
	# def create
	# 	@like = current_user.likes.new(like_params)
	# 	if !@like.save 
	# 		flash[:notice] = @like.errors.full_messages.to_sentence
	# 	end

	# 	redirect_to @like.article if @like.save
	# end

	# def destroy
	# 	@like = current_user.likes.find(params[:id])
	# 	article = @like.article
	# 	@like.destroy
	# 	redirect_to article
	# end

	# private

	# def like_params
	# 	params.require(:like).permit(:article_id)
	# end
end
