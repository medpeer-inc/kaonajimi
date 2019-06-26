class CreateMasterDivisions < ActiveRecord::Migration[5.2]
  def change
    create_table :master_divisions do |t|
      t.references :master_group, null: false
      t.string     :name, null: false

      t.timestamps
    end
  end
end
