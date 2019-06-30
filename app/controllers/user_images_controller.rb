class UserImagesController < ApplicationController
  SUB_IMAGES_MAX_LENGTH = 2

  def create
    response = attach_images.map do |image|
      { id: image.id, url: rails_blob_path(image, only_path: true) }
    end
    render :json => response
  end

  def destroy
    current_user.sub_images.find(params[:id]).destroy!
  end

  private

  def attach_images
    if params[:type] == 'main'
      current_user.main_image.attach(params[:images])
      [current_user.main_image]
    else
      filled = current_user.sub_images.length >= SUB_IMAGES_MAX_LENGTH
      current_user.sub_images.attach(params[:images]) unless filled
      current_user.sub_images
    end
  end
end
