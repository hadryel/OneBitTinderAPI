class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    check_current_user
    build_and_save_user unless performed?
  end


  private


  def check_current_user
    if current_user != @user
      render json: { errors: "You only can update yourself" }, status: :unprocessable_entity
    end
  end


  def build_and_save_user
    @user.attributes = user_params
    save_user || render_error
  end


  def user_params
    params.require(:user).permit(:name, :college, :company, :description, :latitude, :longitude)
  end


  def save_user
    if @user.save
      render :show
    end
  end


  def render_error
    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  end
end
