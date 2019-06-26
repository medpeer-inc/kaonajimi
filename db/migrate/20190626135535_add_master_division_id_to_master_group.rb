class AddMasterDivisionIdToMasterGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :master_groups, :master_division_id, :bigint, null: false, after: :name
    add_index :master_groups, :master_division_id
  end
end
