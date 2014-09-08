class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create!(comment_params)
    user = User.find(params[:user_id])
    @comment.user_id = user
    redirect_to @blog
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
        params.require(:comment).permit!
    end
end
