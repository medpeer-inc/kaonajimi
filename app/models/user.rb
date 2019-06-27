# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  master_group_id  :bigint           not null
#  profile_text     :text(65535)
#  first_name       :string(255)      not null
#  last_name        :string(255)      not null
#  nearest_station  :string(255)
#  email            :string(255)      not null
#  crypted_password :string(255)
#  salt             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ApplicationRecord
  belongs_to :master_group, class_name: 'Master::Group', foreign_key: :master_group_id, inverse_of: :users
  has_many :user_jobs, dependent: :destroy
  has_many :master_jobs, class_name: 'Master::Job', through: :user_jobs
  has_many :user_taggings, dependent: :destroy
  has_many :user_tags, through: :user_taggings, dependent: :destroy

  has_one_attached :main_image
  has_many_attached :sub_images

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

  scope :recent, -> { order(updated_at: :desc) }
  scope :this_month, -> {
    now = Time.current
    where(created_at: now.beginning_of_month..now)
  }
  scope :like_search, -> (word) {
    sql = <<-'SQL'
      first_name LIKE :word OR last_name LIKE :word OR nearest_station LIKE :word
      OR master_jobs.name LIKE :word OR master_groups.name LIKE :word OR master_divisions.name LIKE :word
    SQL

    eager_load(:master_jobs, master_group: :division)
    .where(sql, word: "%#{word}%")
  }

  def fullname
    "#{last_name} #{first_name}"
  end
end
