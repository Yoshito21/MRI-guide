class AddCompletedToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :completed, :boolean
  end
end
