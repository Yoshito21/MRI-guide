# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_04_19_014738) do

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "contrast_id", null: false
    t.integer "suppression_id", null: false
    t.integer "enhance_id", null: false
    t.text "remarks"
    t.bigint "user_id", null: false
    t.bigint "imaging_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imaging_id"], name: "index_conditions_on_imaging_id"
    t.index ["user_id"], name: "index_conditions_on_user_id"
  end

  create_table "imaging_conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "imaging_id", null: false
    t.bigint "condition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["condition_id"], name: "index_imaging_conditions_on_condition_id"
    t.index ["imaging_id"], name: "index_imaging_conditions_on_imaging_id"
  end

  create_table "imagings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "site_id", null: false
    t.string "purpose", null: false
    t.text "indentification"
    t.text "symptoms"
    t.text "treatment"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_imagings_on_user_id"
  end

  create_table "user_imagings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "imaging_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imaging_id"], name: "index_user_imagings_on_imaging_id"
    t.index ["user_id"], name: "index_user_imagings_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "prefecture_id", null: false
    t.string "occupation"
    t.integer "manufacturer_id"
    t.integer "strength_id"
    t.string "machine"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conditions", "imagings"
  add_foreign_key "conditions", "users"
  add_foreign_key "imaging_conditions", "conditions"
  add_foreign_key "imaging_conditions", "imagings"
  add_foreign_key "imagings", "users"
  add_foreign_key "user_imagings", "imagings"
  add_foreign_key "user_imagings", "users"
end
