class CreateMiddles < ActiveRecord::Migration[6.0]
  def change
    create_table :middles do |t|
      t.string :name
    end
  end
end
