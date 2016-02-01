class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    old_photo = Photo.where(id: params[:prev_image_id]).first

    if @photo.save
      old_photo.destroy if old_photo
      render json: @photo
    else
      render json: old_photo
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
