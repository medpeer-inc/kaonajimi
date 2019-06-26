class UserTagsController < ApplicationController
  def index
    @user_tags = UserTag.all
  end

  def show
    @user_tag = UserTag.find(params[:id])
  end

  def new
    @user_tag = UserTag.new
  end

  def edit
    @user_tag = UserTag.find(params[:id])
  end

  def create
    @user_tag = UserTag.new(user_tag_params)
    if @user_tag.save
      redirect_to @user_tag, notice: 'User tag was successfully created.'
    else
      render :new
    end
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
    @user_tag.destroy
    redirect_to user_tags_url, notice: 'User tag was successfully destroyed.'
  end

  private

  def user_tag_params
    params.fetch(:user_tag, {}).permit(:title, :description)
  end
end
