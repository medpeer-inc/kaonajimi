class UserTagHistory < ApplicationRecord
  belongs_to :user
  belongs_to :tag, class_name: 'UserTag'
  enum status: { add: 0, remove: 1 }
end
