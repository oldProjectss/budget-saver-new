class CreateGroupConversions < ActiveRecord::Migration[7.0]
  def change
    create_table :group_conversions do |t|
      t.integer :group_id, null: false, foreign_key: true, index: true
      t.integer :conversion_id, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
