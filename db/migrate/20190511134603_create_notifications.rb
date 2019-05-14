class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :actor_id
      t.integer :target_id
      t.integer :recipient_id
      t.integer :action

      t.timestamps
    end

    add_index :notifications, :actor_id
    add_index :notifications, :target_id
    add_index :notifications, :action
    add_index :notifications, :recipient_id
  end
end
