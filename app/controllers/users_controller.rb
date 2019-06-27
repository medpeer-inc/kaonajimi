class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user_images = @user.images.to_a
    @tags = @user.user_taggings.map do |taggging|
      # NOTE: 削除するときはtaggingを削除するため、taggingのidを取得
      { tagging_id: taggging.id, title: taggging.user_tag.title }
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
      :password, :password_confirmation, images: []
    )
  end

end
