class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.bigint  :actor_id
      t.bigint  :target_id
      t.bigint  :recipient_id
      t.integer :action

      t.timestamps
    end

    add_index :notifications, :actor_id
    add_index :notifications, :target_id
    add_index :notifications, :action
    add_index :notifications, :recipient_id
  end
end
