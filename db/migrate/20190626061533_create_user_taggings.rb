class CreateUserTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_taggings do |t|
      t.references :user, null: false
      t.references :user_tag, null: false
      t.timestamps
      t.index [:user_id, :user_tag_id], unique: true
    end
  end
end
