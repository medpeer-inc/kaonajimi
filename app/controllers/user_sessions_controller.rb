class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i(new create)

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to root_path, notice: 'ログインしました'
    else
      flash.now[:alert] = 'emailかパスワードに誤りがあります'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: 'ログアウトしました'
  end
end
