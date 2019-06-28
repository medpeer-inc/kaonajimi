# == Schema Information
#
# Table name: user_access_logs
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  requester_id :bigint           not null
#  responser_id :bigint           not null
#
# Indexes
#
#  index_user_access_logs_on_requester_id  (requester_id)
#  index_user_access_logs_on_responser_id  (responser_id)
#

class User::AccessLog < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :responser, class_name: 'User'
end
