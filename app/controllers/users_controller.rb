class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @tags = @user.user_tags
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
    params.require(:user).permit(:profile_text, images: [])
  end

end
