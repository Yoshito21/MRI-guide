class CreateMachines < ActiveRecord::Migration[6.0]
  def change
    create_table :machines do |t|
      t.integer    :manufacturer_id, null: false
      t.integer    :strength_id,     null: false
      t.string     :name
      t.references :occupation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
