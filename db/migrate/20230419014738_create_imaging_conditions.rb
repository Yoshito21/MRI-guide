class CreateImagingConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :imaging_conditions do |t|
      t.references :imaging,   null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.timestamps
    end
  end
end
