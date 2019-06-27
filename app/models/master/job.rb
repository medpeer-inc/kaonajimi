# == Schema Information
#
# Table name: master_jobs
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Master::Job < ApplicationRecord
  has_many :users, through: :user_jobs
  has_many :user_jobs, dependent: :destroy
end
