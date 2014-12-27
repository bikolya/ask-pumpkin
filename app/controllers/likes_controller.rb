class LikesController < ApplicationController
  before_action :check_user, only: [:like, :dislike]

  def like
    likable_type = params[:like][:likable_type].constantize
    likable_id = params[:like][:likable_id]
    @entity = likable_type.find(likable_id)
    current_user.like(@entity)
    respond_to do |format|
      format.js
    end
  end

  def dislike
    likable_type = params[:like][:likable_type].constantize
    likable_id = params[:like][:likable_id]
    @entity = likable_type.find(likable_id)
    current_user.dislike(@entity)
    respond_to do |format|
      format.js
    end
  end

  private

    def check_user
      redirect_to root_path unless current_user
    end

end