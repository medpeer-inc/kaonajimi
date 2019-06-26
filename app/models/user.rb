class User < ApplicationRecord
  belongs_to :master_group, class_name: 'Master::Group'
  has_many :user_jobs, dependent: :destroy
  has_many :master_jobs, class_name: 'Master::Job', through: :user_jobs
  has_many_attached :images

  authenticates_with_sorcery!
end
