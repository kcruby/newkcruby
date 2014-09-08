class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create!(comment_params)
    @comment.user_id = current_user.id
    redirect_to @blog
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
        params.require(:comment).permit!
    end
end
