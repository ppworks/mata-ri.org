class AddStyleToChats < ActiveRecord::Migration
  def change
    add_column :chats, :style, :string
  end
end
