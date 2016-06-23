# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160623032728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name",           null: false
    t.string "last_name",      null: false
    t.string "first_name",     null: false
    t.string "email",          null: false
    t.string "job_title",      null: false
    t.string "business_phone", null: false
    t.string "address",        null: false
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "webpage"
    t.string "notes"
  end

  create_table "employees", force: :cascade do |t|
    t.string "last_name",      null: false
    t.string "first_name",     null: false
    t.string "email",          null: false
    t.string "job_title",      null: false
    t.string "business_phone", null: false
    t.string "address",        null: false
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "webpage"
    t.string "notes"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "quantity",   default: 1, null: false
    t.decimal "unit_price"
    t.decimal "discount"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "code", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "customer_id"
    t.date    "order_date"
    t.date    "shipped_date"
    t.integer "shipper_id"
    t.string  "name"
    t.string  "address"
    t.string  "city"
    t.string  "state"
    t.string  "postal_code"
    t.string  "country"
    t.decimal "shipping_fee"
    t.decimal "taxes"
    t.string  "payment_type"
    t.date    "paid_date"
    t.string  "notes"
    t.decimal "tax_rate"
    t.integer "order_status_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "supplier_id"
    t.string  "product_code",                             null: false
    t.string  "product_name",                             null: false
    t.decimal "standard_cost"
    t.decimal "list_price"
    t.integer "reorder_level",            default: 0,     null: false
    t.integer "target_level",             default: 0,     null: false
    t.boolean "discontinued",             default: false, null: false
    t.integer "minimum_reorder_quantity", default: 0,     null: false
    t.string  "category",                                 null: false
  end

  create_table "shippers", force: :cascade do |t|
    t.string "name",           null: false
    t.string "last_name",      null: false
    t.string "first_name",     null: false
    t.string "email",          null: false
    t.string "job_title",      null: false
    t.string "business_phone", null: false
    t.string "address",        null: false
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "webpage"
    t.string "notes"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name",           null: false
    t.string "last_name",      null: false
    t.string "first_name",     null: false
    t.string "email",          null: false
    t.string "job_title",      null: false
    t.string "business_phone", null: false
    t.string "address",        null: false
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "webpage"
    t.string "notes"
  end

end
