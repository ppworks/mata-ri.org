class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :providers, [:name], name: :idx_n_on_providers
  end
end
