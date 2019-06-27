class UserTaggingsController < ApplicationController
  def destroy
    @tagging = UserTagging.find(params[:id])
    ActiveRecord::Base.transaction do
      @tagging.destroy!
      UserTagHistory.create!(
        user_tag_id: @tagging.user_tag_id,
        user_id: @tagging.user_id,
        status: :remove
      )
    end
  end
end
