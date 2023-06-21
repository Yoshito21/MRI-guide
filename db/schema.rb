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

ActiveRecord::Schema.define(version: 2023_06_20_080415) do

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "contrast_id", null: false
    t.integer "suppression_id", null: false
    t.integer "enhance_id", null: false
    t.bigint "occupation_id", null: false
    t.bigint "imaging_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imaging_id"], name: "index_conditions_on_imaging_id"
    t.index ["occupation_id"], name: "index_conditions_on_occupation_id"
  end

  create_table "contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "completed"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "heights", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "imaging_heights", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "imaging_id", null: false
    t.bigint "height_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["height_id"], name: "index_imaging_heights_on_height_id"
  end

  create_table "imaging_lows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "imaging_id", null: false
    t.bigint "low_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["low_id"], name: "index_imaging_lows_on_low_id"
  end

  create_table "imaging_middles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "imaging_id", null: false
    t.bigint "middle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["middle_id"], name: "index_imaging_middles_on_middle_id"
  end

  create_table "imagings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "site_id", null: false
    t.string "purpose", null: false
    t.text "identification"
    t.text "symptoms"
    t.text "treatment"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "machines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "manufacturer_id", null: false
    t.integer "strength_id", null: false
    t.string "name"
    t.bigint "occupation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["occupation_id"], name: "index_machines_on_occupation_id"
  end

  create_table "middles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "occupation_machines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "occupation_id", null: false
    t.bigint "machine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["machine_id"], name: "index_occupation_machines_on_machine_id"
    t.index ["occupation_id"], name: "index_occupation_machines_on_occupation_id"
  end

  create_table "occupation_memberships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "occupation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "pending"
    t.index ["occupation_id"], name: "index_occupation_memberships_on_occupation_id"
    t.index ["user_id"], name: "index_occupation_memberships_on_user_id"
  end

  create_table "occupations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "post_code", null: false
    t.integer "prefecture1_id", null: false
    t.string "municipality"
    t.string "address"
    t.string "building_name"
    t.string "phone_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "remarks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "occupation_id"
    t.bigint "imaging_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imaging_id"], name: "index_remarks_on_imaging_id"
    t.index ["occupation_id"], name: "index_remarks_on_occupation_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "prefecture2_id", null: false
    t.bigint "occupation_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["occupation_id"], name: "index_users_on_occupation_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conditions", "imagings"
  add_foreign_key "conditions", "occupations"
  add_foreign_key "contacts", "users"
  add_foreign_key "imaging_heights", "heights"
  add_foreign_key "imaging_lows", "lows"
  add_foreign_key "imaging_middles", "middles"
  add_foreign_key "machines", "occupations"
  add_foreign_key "occupation_machines", "machines"
  add_foreign_key "occupation_machines", "occupations"
  add_foreign_key "occupation_memberships", "occupations"
  add_foreign_key "occupation_memberships", "users"
  add_foreign_key "remarks", "imagings"
  add_foreign_key "remarks", "occupations"
  add_foreign_key "users", "occupations"
end
