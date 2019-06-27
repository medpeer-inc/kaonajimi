class UserTag < ApplicationRecord
  has_many :user_taggings, dependent: :destroy
  has_many :users, through: :user_taggings

  validates :title, presence: true

  def self.popular
    joins(:user_taggings)
    .select('user_tags.id, user_tags.title, count(user_taggings.user_tag_id) as user_count')
    .group(:user_tag_id)
    .order('user_count desc')
  end
end
