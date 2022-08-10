class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :icon
      t.string :name
      t.integer :user_id, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
