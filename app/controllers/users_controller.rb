class UsersController < ApplicationController
  before_filter :authenticate_user!

  protected
    def user_params
      params.require(:user).permit(permitted_params)
    end

  private
    def permitted_params
      [:nickname, :email, :username, :password, :password_confirmation, :avatar]
    end
end