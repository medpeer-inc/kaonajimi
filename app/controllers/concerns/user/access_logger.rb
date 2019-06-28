module User::AccessLogger
  extend ActiveSupport::Concern

  private

  def keep_access_log

    User::AccessLog.create(
      requester: current_user,
      responser: @user
    )
  end
end
