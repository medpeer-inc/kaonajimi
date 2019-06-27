# == Schema Information
#
# Table name: user_jobs
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  master_job_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class UserJob < ApplicationRecord
  belongs_to :user
  belongs_to :master_job, class_name: 'Master::Job'
end
