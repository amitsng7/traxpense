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

ActiveRecord::Schema.define(version: 20161020012620) do

  create_table "amount_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "policy_id"
    t.string   "name"
    t.integer  "gl_code"
    t.integer  "payroll_code"
    t.string   "max_amt_cat"
    t.integer  "max_amt"
    t.string   "receipt"
    t.string   "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "custom_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "policy_id"
    t.string   "name"
    t.integer  "gl_code"
    t.boolean  "tag_required"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "default_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_definations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "policy_id"
    t.boolean  "violation"
    t.boolean  "def_reimburse"
    t.boolean  "def_billable"
    t.integer  "rate_per_mile"
    t.integer  "rate_per_km"
    t.string   "def_unit"
    t.string   "def_dist_cat"
    t.integer  "hourly_wage"
    t.integer  "max_exp_age"
    t.integer  "max_exp_amt"
    t.boolean  "receipt_req"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "expenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "report_id"
    t.boolean  "remiburse"
    t.boolean  "billable"
    t.datetime "date",       null: false
    t.string   "merchant",   null: false
    t.integer  "amount",     null: false
    t.string   "category"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "policies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "owner_email"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "policies_users_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "policy_id"
    t.string   "email"
    t.integer  "role_id"
    t.string   "submit_to_user"
    t.string   "approves_to_user"
    t.integer  "maximum_amount"
    t.string   "alternate_approver"
    t.boolean  "auto_approv"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "report_definations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "policy_id"
    t.string   "currency"
    t.integer  "frequency"
    t.string   "report_header"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "name"
    t.datetime "from_date",  null: false
    t.datetime "to_date",    null: false
    t.string   "status"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "role_id"
    t.string   "email"
    t.string   "password"
    t.string   "confirm_password"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
