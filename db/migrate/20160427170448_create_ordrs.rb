class CreateOrdrs < ActiveRecord::Migration
  def change
    create_table :ordrs do |t|
      t.string :otype
      t.string :ofrom
      t.string :menu
      t.integer :invited
      t.integer :joined
      t.string :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
