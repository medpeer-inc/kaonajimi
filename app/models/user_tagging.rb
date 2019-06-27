# == Schema Information
#
# Table name: user_taggings
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  user_tag_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserTagging < ApplicationRecord
  belongs_to :user
  belongs_to :user_tag
end
