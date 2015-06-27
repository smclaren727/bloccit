class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.create_summary(params.require(:summary).permit(:description))

    if @summary.save!
      flash[:notice] = "Summary saved successfully"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Your summary did not save. Please try again."  
      render :new
    end  

  end  

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end
end