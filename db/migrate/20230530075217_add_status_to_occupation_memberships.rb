class AddStatusToOccupationMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :occupation_memberships, :status, :string, default: 'pending'
  end
end
