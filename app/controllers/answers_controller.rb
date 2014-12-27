class AnswersController < ApplicationController
  helper_method :resource, :collection, :resource_name, :collection_path, :resource_class
  before_action :set_resource, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:create]

  def create
    @answer = current_user.answers.build(resource_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question
    if @answer.save
      redirect_to @answer.question, notice: "Success!"
    else
      redirect_to @answer.question, error: "Error!"
    end
  end

  protected
    def set_resource
      @resource = Answer.find(params[:id])
    end

    def resource_params
      params.require(:answer).permit(permitted_params)
    end

  private

    def check_user
      redirect_to root_path unless current_user
    end

    def permitted_params
      [:body]
    end
end