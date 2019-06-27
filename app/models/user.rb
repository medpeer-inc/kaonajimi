class User < ApplicationRecord
  belongs_to :master_group, class_name: 'Master::Group', foreign_key: :master_group_id, inverse_of: :users
  has_many :user_jobs, dependent: :destroy
  has_many :master_jobs, class_name: 'Master::Job', through: :user_jobs
  has_many_attached :images

  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
end
