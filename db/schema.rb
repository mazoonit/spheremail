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

ActiveRecord::Schema[7.0].define(version: 2023_08_19_005551) do
  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", force: :cascade do |t|
    t.integer "father_id"
    t.integer "mother_id"
    t.integer "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_families_on_address_id"
    t.index ["father_id"], name: "index_families_on_father_id", unique: true
    t.index ["mother_id"], name: "index_families_on_mother_id", unique: true
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "sex"
    t.integer "family_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_type"
    t.index ["family_id"], name: "index_people_on_family_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "families", "addresses"
  add_foreign_key "families", "people", column: "father_id"
  add_foreign_key "families", "people", column: "mother_id"
  add_foreign_key "people", "families"
end
