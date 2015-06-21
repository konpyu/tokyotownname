class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer    :user_id
      t.string     :kind
      t.string     :key
      t.string     :image
      t.string     :ext
      t.string     :original_name
      t.integer    :width
      t.integer    :height
      t.integer    :size
      t.text       :caption
      t.string     :imageable_type
      t.integer    :imageable_id
      t.timestamps null: false
    end
    add_index :images, :user_id
    add_index :images, :key
  end
end
