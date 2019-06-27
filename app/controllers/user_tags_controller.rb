class UserTagsController < ApplicationController
  def index
    @user_tags = UserTag.all
  end

  def show
    @user_tag = UserTag.find(params[:id])
  end

  def edit
    @user_tag = UserTag.find(params[:id])
  end

  def create
    ActiveRecord::Base.transaction do
      user_tag = UserTag.find_or_create_by!(user_tag_params)
      @taggging = UserTagging.create!(user_tag: user_tag, user_id: params[:user_id])
      UserTagHistory.create!(user_tag: user_tag, user_id: params[:user_id], status: :add)
    end
    render :json => { tagging_id: @taggging.id }
  end

  def update
    @user_tag = UserTag.find(params[:id])
    if @user_tag.update(user_tag_params)
      redirect_to @user_tag, notice: 'User tag was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user_tag = UserTag.find(params[:id])
    @user_tag.destroy!
  end

  private

  def user_tag_params
    params.fetch(:user_tag, {}).permit(:title, :description)
  end
end
