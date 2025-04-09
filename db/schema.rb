# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_26_182518) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "ratings", force: :cascade do |t|
    t.integer "score"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mediaType"
    t.string "media_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "backendName"
    t.string "email"
    t.datetime "dateOfBirth"
  end

  create_table "movies", force: :cascade do |t|
    t.integer "movie_id"
    t.string "original_language"
    t.string "original_title"
    t.string "title"
    t.string "overview"
    t.string "popularity"
    t.string "poster_path"
    t.string "release_date"
    t.string "vote_average"
    t.string "vote_count"
    t.string "average_rating"
  end

  create_table "movieGenres", force: :cascade do |t|
    t.integer "genre_id"
    t.string "genre"
  end

  create_table "movies_to_movieGenres", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "genre_id"
end

  create_table "recommendations", force: :cascade do |t|
    t.integer "score"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "media_id"
  end
