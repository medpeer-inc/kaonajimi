class RemoveMasterGroupIdToMasterDivision < ActiveRecord::Migration[5.2]
  def change
    remove_column :master_divisions, :master_group_id, :bigint
  end
end
