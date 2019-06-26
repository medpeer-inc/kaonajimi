class CreateUserTags < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tags do |t|
      t.string :title, null: false
      t.text :description
      t.timestamps
    end
  end
end
