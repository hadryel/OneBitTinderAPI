class Api::V1::LikeController < ApplicationController
  def create
    @like = current_user.likes_given.build(like_params)
    save_like || render_error
  end


  private


  def like_params
    params.require(:like).permit(:liked).merge(likee_id: params[:user_id])
  end


  def save_like
    if @like.save
      head :ok
    end
  end


  def render_error
    render json: { errors: @like.errors.full_messages }, status: :unprocessable_entity
  end
end
