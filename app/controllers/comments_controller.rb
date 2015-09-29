class CommentsController < ApplicationController
	before_filter :load_commentable
	def create
	  @comment = @commentable.comments.build(load_params)
	  #@comment.user = current_user
	  respond_to do |format|
	    if @comment.save
	      format.html { redirect_to @commentable }
	    else
	      format.html { render :action => 'new' }
	    end
	  end
	end

	protected
	def load_commentable
	  comment_params = load_params
	  @commentable = load_params[:commentable_type].camelize.constantize.find(load_params[:commentable_id])
	end

	def load_params
	  params.require(:comment).permit(:commentable_id,:commentable_type,:title,:comment)
	end
end
