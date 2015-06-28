class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|
      t.integer :user_id,      null: false
      t.string  :kind,         null: false
      t.string  :livable_type, null: false
      t.integer :livable_id,   null: false

      t.timestamps null: false
    end
    add_index :lives, [:user_id, :livable_type, :livable_id], unique: true, name: 'i1'
  end
end
