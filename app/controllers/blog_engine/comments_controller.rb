module BlogEngine
  class CommentsController < ApplicationController
    def index 
      @comments = Comment.all
    end
    def create
      @post = Psot.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      flash[:notice] = "Comment has been created!"
      redirect_to articles_path
    end
    
    private
      def comment_params
        params.require(:comment).permit(:text)
      end
    
  end
end