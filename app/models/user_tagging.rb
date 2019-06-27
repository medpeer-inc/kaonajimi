class UserTagging < ApplicationRecord
  belongs_to :user
  belongs_to :user_tag
end
