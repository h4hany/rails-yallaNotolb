class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :joined
      t.references :user, index: true, foreign_key: true
      t.references :ordr, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
