class CreateImagingLows < ActiveRecord::Migration[6.0]
  def change
    create_table :imaging_lows do |t|
      t.bigint     :imaging_id, null: false, foreign_key: true
      t.references :low,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
