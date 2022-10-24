class CommentsController < ApplicationController
before_action :authenticate_user!
# before_action :check_subscription_status

def create
	@article = Article.find(params[:article_id])
	@comment = @article.comments.create(comment_params)
	@comment.user_id = current_user.id
	@comment.article_id = @article.id

	if @comment.save
		redirect_to article_path(@article)
	else
		redirect_to article_path(@article)
	end
end

private 

def comment_params
	params.require(:comment).permit(:content)
end

end
