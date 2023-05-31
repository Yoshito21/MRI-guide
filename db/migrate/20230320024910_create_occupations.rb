class CreateOccupations < ActiveRecord::Migration[6.0]
  def change
    create_table :occupations do |t|
      t.string  :name,           null: false
      t.string  :post_code,      null: false
      t.integer :prefecture1_id, null: false
      t.string  :municipality
      t.string  :address
      t.string  :building_name
      t.string  :phone_number,   null: false, unique: true
      t.timestamps
    end
  end
end
