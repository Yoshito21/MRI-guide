class CreateLows < ActiveRecord::Migration[6.0]
  def change
    create_table :lows do |t|
      t.string :name
    end
  end
end
