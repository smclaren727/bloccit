class CommentsController < ApplicationController
  def new
   @post = Post.find(params[:post_id])
   @comment = Comment.new
   authorize @comment
  end
  
  def create
     @post = Post.find(params[:post_id])
     @comments = @post.comments
     @comment = @post.comments.new(comment_params)
     @comment.user = current_user
     @topic = @comment.post.topic
     authorize @comment
     if @comment.save
       flash[:notice] = "Comment was saved."
       redirect_to [@topic, @comment.post]
     else
       flash[:error] = "There was an error saving the comment. Please try again."
       render "posts/show" 
     end
       
   end

  def comment_params
     params.require(:comment).permit(:body)
  end
end
