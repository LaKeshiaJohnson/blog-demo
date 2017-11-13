class ArticlesController < ApplicationController

	#http_basic_authenticate_with name: "lakeshia", password: "password", except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		#this instance variable @article is different than the one in the 
		#def create method. 2 different methods. 2 different scopes
	end

	def new
		@article = Article.new

	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		#render plain: params[:article].inspect
		#create instance varibale of the class article (model) & pass in params
		#.save looks to model & writes it to the database
		#redirct - go to this instance variable
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

end
