class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.integer    :location_id,    null: false
      t.integer    :contrast_id,    null: false
      t.integer    :suppression_id, null: false
      t.integer    :enhance_id,     null: false
      t.text       :remarks
      t.references :occupation,     null: false, foreign_key: true
      t.references :imaging,        null: false, foreign_key: true
      t.timestamps
    end
  end
end