class UsersController < ApplicationController
  before_action :set_users_showroom
  before_action :showroom_params, only: [:showroom]
  def showroom
  end

  private
  def set_users_showroom
    # raise params.inspect
    if User.exists?(showroom_params[:format])
      @user = User.find(params[:format])
      @user_dresses = Dress.where(user_id: @user.id)
    else
      redirect_to root_path
    end
  end
  def showroom_params
    params.permit(:format)
  end
end
