class CreateConversions < ActiveRecord::Migration[7.0]
  def change
    create_table :conversions do |t|
      t.decimal :amount, default: 0.0
      t.string :name, null: false
      t.integer :author_id, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
