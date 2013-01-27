class CreateFortuneSlips < ActiveRecord::Migration
  def change
    create_table :fortune_slips do |t|
      t.text :content, null: false

      t.timestamps
    end
  end
end
