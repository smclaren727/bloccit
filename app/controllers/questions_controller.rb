class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
      if @question.save
        flash[:notice] = "Question was saved."
        redirect_to @question
      else
        flash[:error] = "There was an error saving the question. Please try again."
        render :new
      end
    end
  end

  def show
    @question = Question.find(params[:title])
  end

  def edit
    @question = Question.find(params[:title])
  end

  def update
    @question = Question.find(params[:title])
    if @question.update_attributes(params.require(:question).permit(:title, :body))
      flash[:notice] = "Question was updated."
      redirect_to @question
    else
      flash[:error] = "There was an error saving the question. Please try again."
  end

  def destroy
    @question = Question.find(params[:title])
    @question.destroy
  end
end
