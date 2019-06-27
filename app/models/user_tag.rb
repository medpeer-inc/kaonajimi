class UserTag < ApplicationRecord
  has_many :user_taggings
  has_many :users, through: :user_taggings

  validates :title, presence: true
end
