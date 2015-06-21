class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer    :user_id, null: false
      t.integer    :town_id, null: false
      t.integer    :ward_id, null: false
      t.text       :comment
      t.timestamps null: false
    end
    add_index :photos, :user_id
    add_index :photos, :ward_id
    add_index :photos, :town_id
  end
end
