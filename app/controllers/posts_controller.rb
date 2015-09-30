class PostsController < ApplicationController
	def index
		@articles = Post.all
	end

	def new
		@article = Post.new
	end

	def create
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
		commentable = Post.friendly.find(params[:id])
		@article = commentable
		@comments = commentable.comments.all
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
	  @article = Post.find(params[:id])
	  @article.destroy
	  redirect_to posts_path
	end

	private
	def blog_params
		params.require(:article).permit(:title,:body,:tag_list)
	end

	def comment_params
		params.require(:comment).permit(:article_id,:title,:comment)
	end

end
