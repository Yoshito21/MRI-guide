class CreateRemarks < ActiveRecord::Migration[6.0]
  def change
    create_table :remarks do |t|
      t.text       :content,    null: false
      t.references :occupation, foreign_key: true
      t.references :imaging,    foreign_key: true
      t.timestamps
    end
  end
end
