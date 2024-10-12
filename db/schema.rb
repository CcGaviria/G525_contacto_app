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

ActiveRecord::Schema[7.2].define(version: 2024_10_12_171449) do
  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_cities_on_department_id"
  end

  create_table "contacts", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "sex"
    t.date "birth_date"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.string "address_details"
    t.string "country"
    t.string "department"
    t.string "city"
    t.text "information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id", null: false
    t.bigint "country_id", null: false
    t.bigint "department_id", null: false
    t.index ["city_id"], name: "index_contacts_on_city_id"
    t.index ["country_id"], name: "index_contacts_on_country_id"
    t.index ["department_id"], name: "index_contacts_on_department_id"
  end

  create_table "countries", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_departments_on_country_id"
  end

  add_foreign_key "cities", "departments"
  add_foreign_key "contacts", "cities"
  add_foreign_key "contacts", "countries"
  add_foreign_key "contacts", "departments"
  add_foreign_key "departments", "countries"
end
