
ActiveRecord::Schema.define(version: 20170202233300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "post_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.index ["post_id"], name: "index_cities_on_post_id", using: :btree
    t.index ["slug"], name: "index_cities_on_slug", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.text     "title"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "city_id"
    t.integer  "user_id"
    t.index ["city_id"], name: "index_posts_on_city_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "current_city"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "rank"
    t.integer  "points"
    t.string   "email"
    t.string   "password_digest"
    t.string   "photo"
    t.string   "slug"
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  add_foreign_key "posts", "cities"
  add_foreign_key "posts", "users"
end
