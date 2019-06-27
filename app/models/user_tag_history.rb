class UserTagHistory < ApplicationRecord
  belongs_to :user
  belongs_to :user_tag
  enum status: { add: 0, remove: 1 }
  scope :recent, -> { order(updated_at: :desc) }
end
