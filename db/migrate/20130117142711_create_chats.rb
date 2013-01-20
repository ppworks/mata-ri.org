class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :room_id, null: false
      t.integer :user_id
      t.string :user_name, null: false
      t.text :content, null: false
      t.string :color, null: false
      t.string :type, null: false

      t.timestamps
    end
  end
end
