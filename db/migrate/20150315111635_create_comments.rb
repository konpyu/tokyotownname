class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text      :comment
      t.string    :commentable_type
      t.integer   :commentable_id
      t.integer   :user_id
      t.integer   :commentable_user_id
      t.integer   :like_count,             default: 0
      t.string    :ip
      t.timestamps null: false
    end
    add_index :comments, :user_id
    add_index :comments, :commentable_user_id
  end
end
