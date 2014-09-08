class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.new(comment_params) do |cmnt|
    	cmnt.save!
    end
    @comment.user = current_user
    redirect_to @blog
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
        params.require(:comment).permit!
    end
end
