class AddColorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :color, :string, null:false, default: '#000000'
  end
end
