class Master::Division < ApplicationRecord
  belongs_to :master_group, class_name: 'Master::Group'
end
