class Master::Group < ApplicationRecord
  belongs_to :division, class_name: 'Master::Division', foreign_key: :master_division_id, inverse_of: :groups
end
