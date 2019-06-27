# == Schema Information
#
# Table name: master_groups
#
#  id                 :bigint           not null, primary key
#  name               :string(255)      not null
#  master_division_id :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Master::Group < ApplicationRecord
  belongs_to :division, class_name: 'Master::Division', foreign_key: :master_division_id, inverse_of: :groups
  has_many :users, foreign_key: :master_group_id, dependent: :destroy, inverse_of: :master_group
end
