class CreateMasterJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :master_jobs do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
