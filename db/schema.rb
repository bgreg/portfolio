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

ActiveRecord::Schema.define(version: 20150830170906) do

  create_table "exposures", force: :cascade do |t|
    t.string   "cve_id"
    t.text     "summary"
    t.text     "published"
    t.string   "cvss_severity"
    t.text     "title"
    t.integer  "cvss_v2_base_score"
    t.text     "access_vector"
    t.text     "access_complexity"
    t.text     "authentication"
    t.text     "confidentiality_impact"
    t.text     "integrity_impact"
    t.text     "availablility_impact"
    t.boolean  "ruby"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exposures", ["cve_id"], name: "index_exposures_on_cve_id"
  add_index "exposures", ["ruby"], name: "index_exposures_on_ruby"

  create_table "references", force: :cascade do |t|
    t.text     "source"
    t.text     "url"
    t.integer  "exposure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
