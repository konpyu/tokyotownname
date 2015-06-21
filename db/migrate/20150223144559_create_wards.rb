class CreateWards < ActiveRecord::Migration
  def change
    create_table :wards do |t|
      t.string   :name
      t.string   :roman_name
      t.integer  :post_num,   default: 0
      t.timestamps null: false
    end
  end
end
