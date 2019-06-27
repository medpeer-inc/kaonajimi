class UserImagesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    if params[:type] == 'main'
      @user.main_image.attach(params[:images])
      @images = [@user.main_image]
    else
      @user.sub_images.attach(params[:images])
      @images = @user.sub_images
    end
    render :json => @images.map { |image| { url: rails_blob_path(image, only_path: true) } }
  end
end
