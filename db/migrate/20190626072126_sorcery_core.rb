class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :master_group, null: false, index: { unique: true }
      t.text :profile_text
      t.string :email,            null: false
      t.string :crypted_password
      t.string :salt

      t.timestamps                null: false
    end

    add_index :users, :email, unique: true
  end
end
