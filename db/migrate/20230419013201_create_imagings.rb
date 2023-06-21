class CreateImagings < ActiveRecord::Migration[6.0]
  def change
    create_table :imagings do |t|
      t.integer :site_id,         null: false
      t.string  :purpose,         null: false
      t.text    :identification
      t.text    :symptoms
      t.text    :treatment
      t.text    :comment
      t.timestamps
    end
  end
end
