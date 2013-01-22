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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130122002549) do

  create_table "activity_streams", :force => true do |t|
    t.integer  "agency_id"
    t.integer  "user_id"
    t.integer  "care_recipient_id"
    t.string   "stream_type"
    t.string   "label"
    t.integer  "reference_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "agencies", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.string   "administrative_contact"
    t.string   "website"
    t.string   "email"
    t.datetime "created_at",                                                             :null => false
    t.datetime "updated_at",                                                             :null => false
    t.text     "bio"
    t.string   "phone"
    t.integer  "status"
    t.integer  "subscription_tier_id"
    t.date     "next_billing_date"
    t.decimal  "monthly_price_override", :precision => 11, :scale => 2
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "billing_location_id"
    t.decimal  "overtime_multiplier",    :precision => 11, :scale => 2, :default => 1.5
    t.integer  "account_number"
    t.text     "braintree_customer_id"
  end

  create_table "agency_invoice_payments", :force => true do |t|
    t.integer  "agency_invoice_id"
    t.string   "payment_method"
    t.decimal  "amount",            :precision => 11, :scale => 2, :default => 0.0
    t.datetime "date"
    t.integer  "status"
    t.string   "token"
    t.text     "notes"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "agency_invoice_rows", :force => true do |t|
    t.integer  "agency_invoice_id"
    t.string   "label"
    t.integer  "quantity",                                         :default => 1
    t.decimal  "unit_price",        :precision => 11, :scale => 2, :default => 0.0
    t.string   "notes"
    t.string   "status"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "agency_invoices", :force => true do |t|
    t.integer  "agency_id"
    t.decimal  "total",             :precision => 11, :scale => 2, :default => 0.0
    t.date     "invoice_date"
    t.date     "due_date"
    t.date     "auto_billing_date"
    t.text     "notes"
    t.integer  "status"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "billing_batches", :force => true do |t|
    t.integer  "agency_id"
    t.datetime "batch_date"
    t.text     "notes"
    t.date     "period_start"
    t.date     "period_end"
    t.string   "status",       :default => "pending"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "billing_line_items", :force => true do |t|
    t.integer  "billing_batch_id"
    t.integer  "care_recipient_id"
    t.integer  "pay_status"
    t.decimal  "hours",              :precision => 11, :scale => 2, :default => 0.0
    t.decimal  "bill_rate",          :precision => 11, :scale => 2, :default => 0.0
    t.decimal  "adjustments",        :precision => 11, :scale => 2, :default => 0.0
    t.decimal  "original_bill_rate", :precision => 11, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
  end

  create_table "care_recipients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "dob"
    t.integer  "default_location_id"
    t.datetime "created_at",                                                                 :null => false
    t.datetime "updated_at",                                                                 :null => false
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.integer  "agency_id"
    t.decimal  "default_bill_rate",          :precision => 11, :scale => 2, :default => 0.0
  end

  create_table "care_recipients_locations", :force => true do |t|
    t.integer  "care_recipient_id"
    t.integer  "location_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "care_recipients_users", :force => true do |t|
    t.integer  "care_recipient_id"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "caregiver_tasks", :force => true do |t|
    t.string   "label"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "weight",     :default => 0
  end

  create_table "check_ins", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "latitude",   :precision => 11, :scale => 8
    t.decimal  "longitude",  :precision => 11, :scale => 8
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "in_out"
    t.integer  "visit_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.decimal  "latitude",                   :precision => 11, :scale => 8
    t.decimal  "longitude",                  :precision => 11, :scale => 8
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.string   "outside_photo_file_name"
    t.string   "outside_photo_content_type"
    t.integer  "outside_photo_file_size"
    t.datetime "outside_photo_updated_at"
    t.integer  "agency_id"
    t.string   "line2"
  end

  create_table "notes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "care_recipient_id"
    t.text     "note"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "visit_id"
  end

  create_table "oauth_access_grants", :force => true do |t|
    t.integer  "resource_owner_id", :null => false
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.integer  "expires_in",        :null => false
    t.string   "redirect_uri",      :null => false
    t.datetime "created_at",        :null => false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], :name => "index_oauth_access_grants_on_token", :unique => true

  create_table "oauth_access_tokens", :force => true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        :null => false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], :name => "index_oauth_access_tokens_on_refresh_token", :unique => true
  add_index "oauth_access_tokens", ["resource_owner_id"], :name => "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], :name => "index_oauth_access_tokens_on_token", :unique => true

  create_table "oauth_applications", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "uid",          :null => false
    t.string   "secret",       :null => false
    t.string   "redirect_uri", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "oauth_applications", ["uid"], :name => "index_oauth_applications_on_uid", :unique => true

  create_table "patient_statuses", :force => true do |t|
    t.string   "label"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "weight",     :default => 0
  end

  create_table "payroll_batches", :force => true do |t|
    t.integer  "agency_id"
    t.datetime "batch_date"
    t.text     "notes"
    t.date     "period_start"
    t.date     "period_end"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "status",       :default => "pending"
  end

  create_table "payroll_line_items", :force => true do |t|
    t.integer  "payroll_batch_id"
    t.integer  "user_id"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.integer  "pay_status",                                           :default => 0,   :null => false
    t.decimal  "regular_hours_worked",  :precision => 11, :scale => 2, :default => 0.0
    t.decimal  "overtime_hours_worked", :precision => 11, :scale => 2, :default => 0.0
    t.decimal  "overtime_rate",         :precision => 11, :scale => 2, :default => 0.0
    t.decimal  "adjustments",           :precision => 11, :scale => 2, :default => 0.0
    t.decimal  "pay_rate",              :precision => 11, :scale => 2, :default => 0.0
    t.decimal  "original_pay_rate",     :precision => 11, :scale => 2, :default => 0.0
  end

  create_table "photos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "care_recipient_id"
    t.integer  "note_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "visit_id"
    t.string   "caption"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subscription_tiers", :force => true do |t|
    t.string   "label"
    t.decimal  "monthly_fee", :precision => 11, :scale => 2, :default => 0.0
    t.integer  "max_users",                                  :default => 0
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.text     "description"
    t.boolean  "visible",                                    :default => true
    t.boolean  "active",                                     :default => true
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                     :default => "",    :null => false
    t.string   "encrypted_password",                                        :default => "",    :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "date_of_birth"
    t.string   "gender"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                             :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                                   :null => false
    t.datetime "updated_at",                                                                   :null => false
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.integer  "agency_id"
    t.text     "settings"
    t.decimal  "default_pay_rate",           :precision => 11, :scale => 2, :default => 0.0
    t.string   "middle_name"
    t.string   "phone"
    t.string   "sms"
    t.boolean  "is_active",                                                 :default => true
    t.boolean  "deleted",                                                   :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visits", :force => true do |t|
    t.datetime "in_time"
    t.datetime "out_time"
    t.boolean  "approved"
    t.integer  "user_id"
    t.integer  "care_recipient_id"
    t.integer  "location_id"
    t.integer  "agency_id"
    t.datetime "created_at",                                                                 :null => false
    t.datetime "updated_at",                                                                 :null => false
    t.decimal  "bill_rate",                 :precision => 11, :scale => 2, :default => 0.0
    t.decimal  "pay_rate",                  :precision => 11, :scale => 2, :default => 0.0
    t.integer  "approved_by_user_id"
    t.integer  "payroll_line_item_id"
    t.boolean  "billable",                                                 :default => true, :null => false
    t.integer  "break_minutes",                                            :default => 0
    t.integer  "duration_minutes",                                         :default => 0
    t.integer  "billable_duration_minutes",                                :default => 0
    t.string   "guid"
    t.integer  "billing_line_item_id"
  end

  create_table "visits_caregiver_tasks", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "caregiver_task_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "visits_patient_statuses", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "patient_status_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
