class UserTag < ApplicationRecord
  has_many :user_taggings
  has_many :users, through: :user_taggings

  valdates :title, presence: true
end
