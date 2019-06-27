class CreateUserTagHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tag_histories do |t|
      t.references :user, null: false
      t.references :user_tag, null: false
      t.integer :status, null: false
      t.timestamps
    end
  end
end
