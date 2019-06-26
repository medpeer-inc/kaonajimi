class UserJob < ApplicationRecord
  belongs_to :user
  belongs_to :master_job, class_name: 'Master::Job'
end
