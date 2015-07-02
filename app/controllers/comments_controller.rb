class CommentsController < ApplicationController
  def new
   @post = Post.find(params[:post_id])
   @comment = Comment.new
   authorize @comment
  end
  
  def create
     @post = Post.find(params[:post_id])
     @comments = @post.comments
     @comment = current_user.comments.build(comment_params)
     @comment.post = @post
     authorize @comment
     if @comment.save
       flash[:notice] = "Comment was saved."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "There was an error saving the comment. Please try again."
       render "posts/show" 
     end      
   end

  def destroy
     @post = Post.find(params[:post_id])
     @comment = Comment.find(params[:id])
     authorize @comment
     if @comment.destroy
      flash[:notice] = "Comment was removed."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "There was an error removing the comment. Please try again."
       render 'posts/show'
     end
  end

  def comment_params
     params.require(:comment).permit(:body)
  end
end