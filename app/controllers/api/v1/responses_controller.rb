class Api::V1::ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :update, :destroy]

  def index
    @responses = Response.includes(:user, :survey, :answers)
    render json: @responses
  end

  def show
    render json: @response
  end

  def create
    @response = Response.new(response_params)
    if @response.save
      render json: @response, status: :created
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  def update
    if @response.update(response_params)
      render json: @response
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @response.destroy
    head :no_content
  end

  private

  def set_response
    @response = Response.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:survey_id, :user_id)
  end
end
