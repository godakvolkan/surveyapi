class Api::V1::AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update, :destroy]

  def index
    @answers = Answer.includes(:question, :response)
    render json: @answers
  end

  def show
    render json: @answer
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      render json: @answer, status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @answer.destroy
    head :no_content
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:text, :is_correct, :question_id, :response_id)
  end
end
