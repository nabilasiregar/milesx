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

ActiveRecord::Schema.define(version: 2019_11_06_080638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "departure"
    t.string "arrival"
    t.date "departure_date"
    t.date "return_date"
    t.integer "price"
    t.string "status"
    t.boolean "ticket_received"
    t.integer "amount_of_miles"
    t.bigint "user_id"
    t.bigint "miles_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "flight_number"
    t.index ["miles_profile_id"], name: "index_bookings_on_miles_profile_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "miles_profiles", force: :cascade do |t|
    t.string "programme"
    t.integer "amount"
    t.integer "price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_miles_profiles_on_user_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
  end

  create_table "payments", force: :cascade do |t|
    t.boolean "released"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_payments_on_booking_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "confirmed"
    t.string "photo"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_requests_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "photo"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birth_date"
    t.integer "success_rate"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "miles_profiles"
  add_foreign_key "bookings", "users"
  add_foreign_key "miles_profiles", "users"
  add_foreign_key "passengers", "bookings"
  add_foreign_key "payments", "bookings"
  add_foreign_key "requests", "bookings"
end
