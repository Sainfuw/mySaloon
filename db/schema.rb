# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_04_230431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billings", force: :cascade do |t|
    t.string "code"
    t.string "payment_method"
    t.decimal "amount", precision: 19, scale: 4
    t.string "currency"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_billings_on_user_id"
  end

  create_table "booking_services", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "booking_id"
    t.bigint "billing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billing_id"], name: "index_booking_services_on_billing_id"
    t.index ["booking_id"], name: "index_booking_services_on_booking_id"
    t.index ["service_id"], name: "index_booking_services_on_service_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.text "title"
    t.text "comment"
    t.datetime "start"
    t.datetime "end"
    t.integer "status"
    t.bigint "user_id"
    t.bigint "author_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_bookings_on_author_id"
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "status"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_customers_on_author_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 19, scale: 4
    t.integer "status"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_services_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "lastname"
    t.string "surname"
    t.string "phone"
    t.integer "status"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "billings", "users"
  add_foreign_key "booking_services", "billings"
  add_foreign_key "booking_services", "bookings"
  add_foreign_key "booking_services", "services"
  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "users", column: "author_id"
  add_foreign_key "customers", "users", column: "author_id"
  add_foreign_key "services", "users", column: "author_id"
end
