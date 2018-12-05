class Api::V1::MessagesController < ApplicationController
  def index
    @messages = current_user.matches.find(params[:chat_id]).messages.order(:created_at)
  end


  def create
    @message = current_user.matches.find(params[:chat_id]).messages.build(message_params)
    save_message || render_error
  end


  private


  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end


  def save_message
    if @message.save
      head :ok
    end
  end


  def render_error
    render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
  end
end
