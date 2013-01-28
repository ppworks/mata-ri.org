class AddBaseNameColumnToUsers < ActiveRecord::Migration
  def up
    add_column :users, :base_name, :string
    User.all.to_a.each do |user|
      user.save
    end
  end

  def down
    remove_column :users, :base_name
  end
end
