class ArticlesController < ApplicationController

	def index
		@articles = Article.order("created_at DESC")
	end

	def new
		unless current_user
			flash[:alert] = "Please Login or Signup first"
			redirect_to '/'
		else
			@article = current_user.articles.build
		end
	end

	def create
		return redirect_to '/', flash[:alert] = "Please Login or Signup first" unless current_user

		@article = current_user.articles.build(article_params)
		if @article.save
			redirect_to article_path(@article)
		else
			flash[:alert] = "Article Creation Failed, Please Try Again"
			redirect_to new_article_path
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	private
	def article_params
		params.require(:article).permit(:title, :body)
	end
end
