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

ActiveRecord::Schema.define(version: 20160607131422) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street",     limit: 255
    t.string   "district",   limit: 255
    t.string   "city",       limit: 255
    t.string   "zipcode",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "cpf",        limit: 255
    t.string   "phone",      limit: 255
    t.integer  "address_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "customers", ["address_id"], name: "index_customers_on_address_id", using: :btree
  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer "order_id",          limit: 4
    t.integer "manage_product_id", limit: 4
    t.decimal "total",                       precision: 10
    t.integer "product_id",        limit: 4
  end

  add_index "line_items", ["manage_product_id"], name: "index_line_items_on_manage_product_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "manage_products", force: :cascade do |t|
    t.string   "number",           limit: 255
    t.date     "manufacture_date"
    t.string   "state",            limit: 255
    t.integer  "product_id",       limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "manage_products", ["product_id"], name: "index_manage_products_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "number",         limit: 255
    t.string   "state",          limit: 255
    t.decimal  "total",                      precision: 10
    t.string   "shipment_state", limit: 255
    t.integer  "address_id",     limit: 4
    t.integer  "customer_id",    limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.date     "initial_date"
    t.date     "final_date"
  end

  add_index "orders", ["address_id"], name: "index_orders_on_address_id", using: :btree
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string  "number",      limit: 255
    t.decimal "value",                   precision: 10
    t.date    "due_date"
    t.date    "paid_at"
    t.integer "order_id",    limit: 4
    t.integer "customer_id", limit: 4
  end

  add_index "payments", ["customer_id"], name: "index_payments_on_customer_id", using: :btree
  add_index "payments", ["order_id"], name: "index_payments_on_order_id", using: :btree

  create_table "product_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "description",         limit: 255
    t.decimal  "minimum_price",                   precision: 10
    t.integer  "product_category_id", limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "products", ["product_category_id"], name: "index_products_on_product_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "users"
  add_foreign_key "line_items", "manage_products"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "manage_products", "products"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "customers"
  add_foreign_key "payments", "customers"
  add_foreign_key "payments", "orders"
  add_foreign_key "products", "product_categories"
end
