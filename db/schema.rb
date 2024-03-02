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

ActiveRecord::Schema[7.1].define(version: 2024_03_02_093159) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_shipping_methods", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "shipping_method_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_shipping_methods_on_item_id"
    t.index ["shipping_method_id"], name: "index_item_shipping_methods_on_shipping_method_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "quantity"
    t.float "price"
    t.string "condition"
    t.text "description"
    t.bigint "user_id", null: false
    t.float "co2_emitions"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.bigint "shipping_method_id", null: false
    t.integer "quantity"
    t.float "distance"
    t.float "total_co2_emitions"
    t.float "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_purchases_on_item_id"
    t.index ["shipping_method_id"], name: "index_purchases_on_shipping_method_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "shipping_methods", force: :cascade do |t|
    t.float "co2_ratio"
    t.integer "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "item_shipping_methods", "items"
  add_foreign_key "item_shipping_methods", "shipping_methods"
  add_foreign_key "items", "users"
  add_foreign_key "purchases", "items"
  add_foreign_key "purchases", "shipping_methods"
  add_foreign_key "purchases", "users"
end
