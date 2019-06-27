# == Schema Information
#
# Table name: user_tag_histories
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  user_tag_id :bigint           not null
#  status      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserTagHistory < ApplicationRecord
  belongs_to :user
  belongs_to :user_tag
  enum status: { add: 0, remove: 1 }
  scope :recent, -> { order(updated_at: :desc) }
end
