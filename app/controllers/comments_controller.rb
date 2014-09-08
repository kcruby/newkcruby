class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create!(params.require(:comment).permit! 
    redirect_to @blog
  end
end
