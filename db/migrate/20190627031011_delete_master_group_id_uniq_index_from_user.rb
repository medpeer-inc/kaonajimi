class DeleteMasterGroupIdUniqIndexFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :master_group_id
    add_index :users, :master_group_id
  end
end
