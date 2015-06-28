class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer  :user_id,     null: false
      t.string   :provider,    null: false
      t.string   :uid
      t.string   :name
      t.string   :nickname
      t.string   :image
      t.string   :email
      t.string   :location
      t.string   :gender
      t.string   :token
      t.string   :secret
      t.timestamps null: false
    end
    add_index :authentications, [:user_id, :provider] , unique: true
  end
end
