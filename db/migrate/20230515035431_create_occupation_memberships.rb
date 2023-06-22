class CreateOccupationMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :occupation_memberships do |t|
      t.references :user,       foreign_key: true
      t.references :occupation, foreign_key: true
      t.timestamps
    end
  end
end
