class UserImagesController < ApplicationController
  SUB_IMAGES_MAX_LENGTH = 2

  def create
    response = attach_images(params[:images]).map do |image|
      { id: image.id, url: rails_blob_path(image, only_path: true) }
    end
    render json: response
  end

  def destroy
    current_user.sub_images.find(params[:id]).destroy!
  end

  private

  def attach_images(images)
    params[:type] == 'main' ? main_attach_images(image) : sub_attach_images(images)
  end

  def main_attach_images(images)
    current_user.main_image.attach(images)
    [current_user.main_image]
  end

  def sub_attach_images(images)
    filled = current_user.sub_images.length >= SUB_IMAGES_MAX_LENGTH
    current_user.sub_images.attach(images) unless filled
    current_user.sub_images
  end
end
