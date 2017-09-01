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

ActiveRecord::Schema.define(version: 20170505165802) do

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome",       default: ""
    t.integer  "country_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["country_id"], name: "index_cities_on_country_id", using: :btree
  end

  create_table "city_universities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "city_id"
    t.integer  "university_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["city_id"], name: "index_city_universities_on_city_id", using: :btree
    t.index ["university_id"], name: "index_city_universities_on_university_id", using: :btree
  end

  create_table "climates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome",       default: ""
    t.string   "desc",       default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "continents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome",       default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "costs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "custo",      default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome",       default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "country_climates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "country_id"
    t.integer  "climate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["climate_id"], name: "index_country_climates_on_climate_id", using: :btree
    t.index ["country_id"], name: "index_country_climates_on_country_id", using: :btree
  end

  create_table "country_continents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "country_id"
    t.integer  "continent_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["continent_id"], name: "index_country_continents_on_continent_id", using: :btree
    t.index ["country_id"], name: "index_country_continents_on_country_id", using: :btree
  end

  create_table "country_languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "country_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["country_id"], name: "index_country_languages_on_country_id", using: :btree
    t.index ["language_id"], name: "index_country_languages_on_language_id", using: :btree
  end

  create_table "course_universities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "course_id"
    t.integer  "university_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["course_id"], name: "index_course_universities_on_course_id", using: :btree
    t.index ["university_id"], name: "index_course_universities_on_university_id", using: :btree
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome",       default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome",       default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "period_universities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "period_id"
    t.integer  "university_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["period_id"], name: "index_period_universities_on_period_id", using: :btree
    t.index ["university_id"], name: "index_period_universities_on_university_id", using: :btree
  end

  create_table "periods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "duracao",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "dt_saida"
    t.date     "dt_retorno"
    t.integer  "dias",                     default: 0
    t.float    "preco",         limit: 24, default: 0.0
    t.string   "obs",                      default: ""
    t.integer  "user_id"
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "country_id"
    t.integer  "continent_id"
    t.integer  "university_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["continent_id"], name: "index_schedules_on_continent_id", using: :btree
    t.index ["country_id"], name: "index_schedules_on_country_id", using: :btree
    t.index ["course_id"], name: "index_schedules_on_course_id", using: :btree
    t.index ["student_id"], name: "index_schedules_on_student_id", using: :btree
    t.index ["university_id"], name: "index_schedules_on_university_id", using: :btree
    t.index ["user_id"], name: "index_schedules_on_user_id", using: :btree
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome",          default: ""
    t.string   "cpf",           default: ""
    t.string   "telefone",      default: ""
    t.string   "univ_origem",   default: ""
    t.string   "cidade",        default: ""
    t.string   "pais",          default: ""
    t.string   "endereco",      default: ""
    t.integer  "course_id"
    t.integer  "university_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["course_id"], name: "index_students_on_course_id", using: :btree
    t.index ["university_id"], name: "index_students_on_university_id", using: :btree
  end

  create_table "universities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome",                  default: ""
    t.float    "valor",      limit: 24, default: 0.0
    t.integer  "country_id"
    t.integer  "cost_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["cost_id"], name: "index_universities_on_cost_id", using: :btree
    t.index ["country_id"], name: "index_universities_on_country_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "city_universities", "cities"
  add_foreign_key "city_universities", "universities"
  add_foreign_key "country_climates", "climates"
  add_foreign_key "country_climates", "countries"
  add_foreign_key "country_continents", "continents"
  add_foreign_key "country_continents", "countries"
  add_foreign_key "country_languages", "countries"
  add_foreign_key "country_languages", "languages"
  add_foreign_key "course_universities", "courses"
  add_foreign_key "course_universities", "universities"
  add_foreign_key "period_universities", "periods"
  add_foreign_key "period_universities", "universities"
  add_foreign_key "schedules", "continents"
  add_foreign_key "schedules", "countries"
  add_foreign_key "schedules", "courses"
  add_foreign_key "schedules", "students"
  add_foreign_key "schedules", "universities"
  add_foreign_key "schedules", "users"
end
