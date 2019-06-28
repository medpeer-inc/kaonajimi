class CreateUserAccessLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_access_logs do |t|
      t.references :requester, null: false
      t.references :responser, null: false

      t.timestamps
    end
  end
end
