class Master::Group < ApplicationRecord
  has_many :divisions, class_name: 'Master::Division', foreign_key: 'master_group_id', dependent: :destroy
end
