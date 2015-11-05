class AddBuildingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :building, :integer
  end
end
