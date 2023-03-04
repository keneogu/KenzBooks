class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	before_action :find_article, only: [:show, :edit, :update, :delete]

	def index
		params[:category] ? @category = params[:category] : @category = "latest"
		if @category == 'latest'
			@articles = Article.all.desc
		else
			@articles = Article.where(:category=>@category).desc
		end
	end

	def show
	end

	def search
		if params[:q].blank?
			redirect_to root_path and return
		else
			@parameter = params[:q].downcase
			@articles = Article.all.where("lower(title) LIKE ?", "%" + "#{@parameter}" + "%")
		end
	end

	def new
		@article = current_user.articles.build
	end

	def create
		@article = current_user.articles.build(article_params)

		if @article.save
      redirect_to root_path
    else
      render :new
    end
	end

	def edit
	end

	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end

	private

	def article_params
		params.require(:article).permit(:title, :category, :image, :bodypdf)
	end

	def find_article
		@article = Article.find(params[:id])
	end
	
end
