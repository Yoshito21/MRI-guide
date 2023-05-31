class CreateImagingHeights < ActiveRecord::Migration[6.0]
  def change
    create_table :imaging_heights do |t|
      t.bigint     :imaging_id, null: false, foreign_key: true
      t.references :height,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
