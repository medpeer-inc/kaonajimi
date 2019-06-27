class UserImagesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.main_image.attach(params[:images])
    render :json => { url: rails_blob_path(@user.main_image, only_path: true) }
  end

  private

  def user_image_params
    params.require(:user).permit(images: [])
  end
end
