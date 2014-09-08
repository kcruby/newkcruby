class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create!(params[:comment])
    redirect_to @blog
  end
end
