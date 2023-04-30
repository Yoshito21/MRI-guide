class CreateUserImagings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_imagings do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :imaging, null: false, foreign_key: true
      t.timestamps
    end
  end
end
