class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.text :name, null: false
      t.text :content
      t.datetime :last_arrived_at
      t.datetime :last_left_at
      t.integer :members_count, null: false, default: 0
      t.integer :max_count, null: false, default: 0
      t.timestamps
    end
  end
end
