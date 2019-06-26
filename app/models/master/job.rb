class Master::Job < ApplicationRecord
  has_many :users, through: :user_jobs
  has_many :user_jobs, dependent: :destroy
end
