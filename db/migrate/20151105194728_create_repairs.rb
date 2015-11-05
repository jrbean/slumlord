class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.integer :tenant_id
      t.integer :manager_id
      t.datetime :submitted_at
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
