class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.integer :image_id
      t.string  :image
      t.string  :email
      t.string  :access_token
      t.boolean :admin_flag,  default: false
      t.integer :post_num,    default: 0
      t.timestamps null: false
    end
  end
end
