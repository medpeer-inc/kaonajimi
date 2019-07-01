class UsersController < ApplicationController
  include User::AccessLogger

  before_action :set_user, only: %i(show edit update)
  before_action :keep_access_log, only: :show

  def index
    word = params[:word]
    @users = users_by_word(word)
  end

  def show
    @sub_images = @user.sub_images.to_a
    @tags = @user.user_taggings.includes(:user_tag).map do |tagging|
      # NOTE: 削除するときはtaggingを削除するため、taggingのidを取得
      { id: tagging.user_tag_id, tagging_id: tagging.id, title: tagging.user_tag.title }
    end
  end

  def edit
    @main_images_attr = @user.main_image.attached? ? [{ id: @user.main_image.id, url: @user.main_image_url }] : []
    @sub_images_attr = @user.sub_images.map do |image|
      { id: image.id, url: rails_blob_path(image, only_path: true) }
    end
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

  def users_by_word(word)
    users = User.like_search(word).to_a
    return users if users.present?

    flash.now[:alert] = '条件に該当するユーザーが見つかりませんでした'
    User.all.to_a
  end
end
