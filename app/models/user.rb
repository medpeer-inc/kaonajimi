class User < ApplicationRecord
  belongs_to :master_group, class_name: 'Master::Group', foreign_key: :master_group_id, inverse_of: :users
  has_many :user_jobs, dependent: :destroy
  has_many :master_jobs, class_name: 'Master::Job', through: :user_jobs

  authenticates_with_sorcery!
end
