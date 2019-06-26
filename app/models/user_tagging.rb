class UserTagging < ApplicationRecord
  belongs_to :user
  belongs_to :tag, class_name: 'UserTag'
end
