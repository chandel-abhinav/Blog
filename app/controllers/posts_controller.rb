class PostsController < ApplicationController
	before_action :authenticate_user!
	def index
		@articles = Post.all
	end

	def new
		@article = Post.new
	end

	def create
		#authorize! :create, Post
		@article = Post.new(blog_params)
		#@article.slug = nil
		#d@article.slug = nil
		#@article.tag_list.add("awesome, slick")
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
		#@article = Post.find(params[:id])
		@article = Post.friendly.find(params[:id])
		#@article = commentable
		@comments = @article.comments.all
		@tags = @article.tag
	end

	def save_comment
		comment_params
		commentable = Post.find(params[:article_id])
		@comment = commentable.comments.create
		@comment.title = params[:title]
		@comment.comment = params[:comment]
		if @comment.save
			redirect_to commentable
		else
			render 'show'
		end
	end

	def destroy
	  #authorize! :destroy, Post
	  @article = Post.find(params[:id])
	  authorize! :destroy, @article
	  @article.destroy
	  redirect_to posts_path
	end

	def edit
	  #authorize! :update, Post
	  @article = Post.friendly.find(params[:id])
	  authorize! :update, @article
	  @tags = @article.tag
	end

	def update
	  #authorize! :update, Post
	  @article = Post.find(params[:id])
	  authorize! :update, @article
	  if @article.update(blog_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end


	private
	def blog_params
		params.require(:article).permit(:title,:body,:tag_list,:user_id)
	end

	def comment_params
		params.require(:comment).permit(:article_id,:title,:comment,:user_id)
	end



end
