class UsersController < ApplicationController
  before_action :set_users_showroom, only: [:showroom]
  before_action :showroom_params, only: [:showroom]
  before_action :authenticate_user!, only: [:showroom, :profile]
  def showroom
  end
  def profile
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
