class User < ApplicationRecord
  belongs_to :master_group, class_name: 'Master::Group', foreign_key: :master_group_id, inverse_of: :users
  has_many :user_jobs, dependent: :destroy
  has_many :master_jobs, class_name: 'Master::Job', through: :user_jobs
  has_many :user_taggings, dependent: :destroy
  has_many :user_tags, through: :user_taggings, dependent: :destroy

  has_many_attached :images

  authenticates_with_sorcery!

  EMAIL_FORMAT = /\A[a-zA-Z0-9\-\._+]+@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,5}\z/

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, format: { with: EMAIL_FORMAT, message: 'メールアドレスの形式が不正です' }
  validates :profile_text, length: { maximum: 65_535 }
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :nearest_station, length: { maximum: 255 }

  def fullname
    "#{last_name} #{first_name}"
  end
end
