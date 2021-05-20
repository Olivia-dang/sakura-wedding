class UsersController < ApplicationController
  before_action :set_user_showroom
  before_action :showroom_params, only: [:showroom]
  def showroom
  end

  private
  def set_user_showroom
    # raise params.inspect
    if User.exists?(showroom_params[:format])
      @user_showroom = User.find(params[:format])
      @user_dresses = Dress.where(user_id: @user_showroom.id)
    else
      redirect_to root_path
    end
  end
  def showroom_params
    params.permit(:format)
  end
end
