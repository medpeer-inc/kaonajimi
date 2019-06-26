class Master::Division < ApplicationRecord
  has_many :groups, class_name: 'Master::Group', foreign_key: :master_division_id, dependent: :destroy, inverse_of: :division
end
