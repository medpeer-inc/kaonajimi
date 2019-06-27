class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update)

  def show
    @user_images = @user.sub_images.to_a
    @tags = @user.user_taggings.includes(:user_tag).map do |tagging|
      # NOTE: 削除するときはtaggingを削除するため、taggingのidを取得
      { id: tagging.user_tag_id, tagging_id: tagging.id, title: tagging.user_tag.title }
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: '情報の更新に成功に成功しました'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :profile_text, :first_name, :last_name, :nearest_station, :email,
      :password, :password_confirmation, :main_image, sub_images: []
    )
  end

end
