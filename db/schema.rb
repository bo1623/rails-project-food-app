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

ActiveRecord::Schema.define(version: 2019_08_11_022603) do

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "dish_rating"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer "user_id"
    t.integer "meal_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals_dishes", force: :cascade do |t|
    t.integer "meal_id"
    t.integer "dish_id"
    t.integer "meal_dish_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "location_id"
    t.datetime "opening_time"
    t.datetime "closing_time"
    t.integer "revenue"
    t.integer "restaurant_rating"
    t.integer "cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "restaurant_id", default: 0
    t.boolean "admin", default: false
    t.boolean "restaurant_manager", default: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "uid"
  end

end
