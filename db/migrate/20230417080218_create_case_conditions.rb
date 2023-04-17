class CreateCaseConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :case_conditions do |t|
      t.references :case,      null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.timestamps
    end
  end
end
