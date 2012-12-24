class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :provider_id, null: false
      t.integer :user_id, null: false
      t.string :user_key
      t.string :access_token
      t.string :refresh_token
      t.string :secret
      t.string :name
      t.string :email
      t.string :image
      t.text :raw

      t.timestamps
    end
    add_index :connections, [:provider_id, :user_key], name: :idx_pi_uk_on_connections
    add_index :connections, [:user_id], name: :idx_ui_on_connections
  end
end
