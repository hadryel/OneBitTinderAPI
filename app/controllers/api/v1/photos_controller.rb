class Api::V1::PhotosController < ApplicationController
  def index
    @photos = current_user.photos
  end


  def create
    @photo = current_user.photos.build(create_params)
    save_photo || render_error
  end


  def update
    @photo = current_user.photos.find(params[:id])
    @photo.attributes = update_params
    save_photo || render_error
  end


  def destroy
    @photo = current_user.photos.find(params[:id])
    @photo.destroy
    head :ok
  end


  private


  def create_params
    params.require(:photo).permit(:file, :default)
  end


  def update_params
    params.require(:photo).permit(:default)
  end


  def save_photo
    if @photo.save
      render :show
    end
  end


  def render_error
    render json: { errors: @photo.errors.full_messages }, status: :unprocessable_entity
  end
end
