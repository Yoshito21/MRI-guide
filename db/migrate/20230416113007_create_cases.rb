class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.integer    :site_id,         null: false
      t.string     :purpose,         null: false
      t.text       :indentification
      t.text       :symptoms
      t.text       :treatment
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
