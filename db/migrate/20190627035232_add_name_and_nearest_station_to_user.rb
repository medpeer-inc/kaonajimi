class AddNameAndNearestStationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, null: false, after: :profile_text
    add_column :users, :last_name, :string, null: false, after: :first_name
    add_column :users, :nearest_station, :string, after: :last_name
  end
end
