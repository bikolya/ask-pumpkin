class HomeController < ApplicationController

  def index
    @questions = Question.all.paginate(page: params[:page], per_page: 10)
                             .order('created_at DESC')
    @like = Like.new
  end

end