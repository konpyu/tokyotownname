class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer    :user_id
      t.integer    :photo_id
      t.timestamps null: false
    end
    add_index :favorites, [:user_id, :photo_id], unique: true
  end
end
