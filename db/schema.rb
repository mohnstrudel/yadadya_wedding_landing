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

ActiveRecord::Schema.define(version: 20171009093123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archives", force: :cascade do |t|
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "youtube"
    t.string "zip"
    t.index ["event_id"], name: "index_archives_on_event_id"
  end

  create_table "available_tickets", force: :cascade do |t|
    t.bigint "ticket_type_id"
    t.bigint "event_id"
    t.integer "amount"
    t.float "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "remaining_amount"
    t.bigint "request_id"
    t.boolean "approval"
    t.index ["event_id"], name: "index_available_tickets_on_event_id"
    t.index ["request_id"], name: "index_available_tickets_on_request_id"
    t.index ["ticket_type_id"], name: "index_available_tickets_on_ticket_type_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "event_organizers", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "organizer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_organizers_on_event_id"
    t.index ["organizer_id"], name: "index_event_organizers_on_organizer_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "date"
    t.string "title"
    t.string "place"
    t.float "long"
    t.float "lat"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lecture_id"
    t.bigint "event_organizer_id"
    t.bigint "ticket_id"
    t.text "flag_top"
    t.text "flag_bottom"
    t.string "povestka_1_text"
    t.string "povestka_1_logo"
    t.string "povestka_2_text"
    t.string "povestka_2_logo"
    t.string "povestka_3_text"
    t.string "povestka_3_logo"
    t.string "povestka_4_text"
    t.string "povestka_4_logo"
    t.string "povestka_5_text"
    t.string "povestka_5_logo"
    t.text "mesto_top"
    t.string "mesto_logo"
    t.text "mesto_bottom"
    t.string "subtitle"
    t.string "event_type"
    t.datetime "sortable_date"
    t.string "slug"
    t.string "facebook"
    t.index ["event_organizer_id"], name: "index_events_on_event_organizer_id"
    t.index ["lecture_id"], name: "index_events_on_lecture_id"
    t.index ["slug"], name: "index_events_on_slug", unique: true
    t.index ["ticket_id"], name: "index_events_on_ticket_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "lecture_speakers", force: :cascade do |t|
    t.bigint "lecture_id"
    t.bigint "speaker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_lecture_speakers_on_lecture_id"
    t.index ["speaker_id"], name: "index_lecture_speakers_on_speaker_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "timeframe"
    t.string "title"
    t.bigint "event_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lecture_speaker_id"
    t.index ["event_id"], name: "index_lectures_on_event_id"
    t.index ["lecture_speaker_id"], name: "index_lectures_on_lecture_speaker_id"
  end

  create_table "organizers", force: :cascade do |t|
    t.string "title"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_organizer_id"
    t.string "logo_grey"
    t.string "url"
    t.string "logo_additional_css"
    t.index ["event_organizer_id"], name: "index_organizers_on_event_organizer_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "image"
    t.bigint "archive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["archive_id"], name: "index_pictures_on_archive_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "position"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "facebook"
    t.bigint "event_id"
    t.bigint "available_ticket_id"
    t.boolean "payment_status"
    t.string "approval_status"
    t.index ["available_ticket_id"], name: "index_requests_on_available_ticket_id"
    t.index ["event_id"], name: "index_requests_on_event_id"
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "speakers", force: :cascade do |t|
    t.string "picture"
    t.string "last_name"
    t.string "first_name"
    t.text "description"
    t.string "facebook"
    t.string "company"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lecture_speaker_id"
    t.index ["lecture_speaker_id"], name: "index_speakers_on_lecture_speaker_id"
  end

  create_table "ticket_types", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_id"
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "position"
    t.string "phone"
    t.string "facebook"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["ticket_id"], name: "index_users_on_ticket_id"
  end

  add_foreign_key "archives", "events"
  add_foreign_key "available_tickets", "events"
  add_foreign_key "available_tickets", "requests"
  add_foreign_key "available_tickets", "ticket_types"
  add_foreign_key "event_organizers", "events"
  add_foreign_key "event_organizers", "organizers"
  add_foreign_key "events", "event_organizers"
  add_foreign_key "events", "lectures"
  add_foreign_key "events", "tickets"
  add_foreign_key "lecture_speakers", "lectures"
  add_foreign_key "lecture_speakers", "speakers"
  add_foreign_key "lectures", "events"
  add_foreign_key "lectures", "lecture_speakers"
  add_foreign_key "organizers", "event_organizers"
  add_foreign_key "pictures", "archives"
  add_foreign_key "requests", "available_tickets"
  add_foreign_key "requests", "events"
  add_foreign_key "speakers", "lecture_speakers"
  add_foreign_key "tickets", "events"
  add_foreign_key "tickets", "users"
  add_foreign_key "users", "tickets"
end
