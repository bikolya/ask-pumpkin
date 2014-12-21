class QuestionsController < ApplicationController
  helper_method :resource, :collection, :resource_name, :collection_path, :resource_class
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.paginate(page: params[:page], per_page: 10)
                             .order('created_at DESC')
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(resource_params)
    if @question.save
      redirect_to @question, notice: "Success!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(resource_params)
      redirect_to @question, notice: "Success!"
    else
      render :edit
    end
  end

  def destroy
  end

  protected
    def set_resource
      @question = Question.find(params[:id])
    end

    def resource_params
      params.require(:question).permit(permitted_params)
    end

  private
    def permitted_params
      [:title, :body]
    end
end