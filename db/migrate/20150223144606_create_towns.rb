class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.integer  :ward_id
      t.integer  :post_num,   default: 0
      t.string   :name
      t.string   :roman_name
      t.timestamps null: false
    end
  end
end
