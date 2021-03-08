# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_08_225634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "area_histories", force: :cascade do |t|
    t.datetime "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_area_histories_on_user_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "description"
    t.string "qrcode"
    t.bigint "institution_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_areas_on_institution_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "test_covids", force: :cascade do |t|
    t.date "date_did"
    t.date "date_get_result"
    t.boolean "had_symptoms"
    t.string "type_test"
    t.boolean "result"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_histories", force: :cascade do |t|
    t.datetime "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_histories_on_user_id"
  end

  create_table "user_history_details", force: :cascade do |t|
    t.bigint "user_history_id", null: false
    t.bigint "symptom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["symptom_id"], name: "index_user_history_details_on_symptom_id"
    t.index ["user_history_id"], name: "index_user_history_details_on_user_history_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "lasname", null: false
    t.integer "control_number", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "area_histories", "users"
  add_foreign_key "areas", "institutions"
  add_foreign_key "user_histories", "users"
  add_foreign_key "user_history_details", "symptoms"
  add_foreign_key "user_history_details", "user_histories"
end
