class CreateOccupationMachines < ActiveRecord::Migration[6.0]
  def change
    create_table :occupation_machines do |t|
      t.references :occupation, null: false, foreign_key: true
      t.references :machine,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
