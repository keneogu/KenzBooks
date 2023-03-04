class CommentsController < ApplicationController
before_action :authenticate_user!
before_action :find_article
# before_action :check_subscription_status

def create
	@comment = @article.comments.create(comment_params)
	@comment.user_id = current_user.id
	@comment.article_id = @article.id

	if @comment.save
		redirect_to article_path(@article)
	else
		redirect_to article_path(@article)
	end
end

def destroy
	@comment = @article.comments.find(params[:id])
	@comm = @comment.user_id == current_user.id
	if @comm && @comment.destroy
		redirect_to article_path(@article)
	else
		redirect_to article_path(@article)
	end
end

private 

def comment_params
	params.require(:comment).permit(:content)
end

def find_article
	@article = Article.find(params[:article_id])
end

end
