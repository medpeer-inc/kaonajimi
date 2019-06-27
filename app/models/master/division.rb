# == Schema Information
#
# Table name: master_divisions
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Master::Division < ApplicationRecord
  has_many :groups, class_name: 'Master::Group', foreign_key: :master_division_id, dependent: :destroy, inverse_of: :division
end
