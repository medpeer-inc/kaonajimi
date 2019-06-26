class CreateUserJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_jobs do |t|
      t.references :user, null: false
      t.references :master_job, null: false

      t.timestamps
    end
  end
end
