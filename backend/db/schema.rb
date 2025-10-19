ActiveRecord::Schema[7.1].define(version: 2025_10_19_134312) do
  enable_extension "plpgsql"

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "status", null: false
    t.datetime "due_date"
    t.integer "priority"
    t.bigint "user_id", null: false
    t.bigint "weekly_goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
    t.index ["weekly_goal_id"], name: "index_tasks_on_weekly_goal_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weekly_goals", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.text "self_evaluation"
    t.datetime "target_date", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_weekly_goals_on_user_id"
  end

  add_foreign_key "tasks", "users"
  add_foreign_key "tasks", "weekly_goals"
  add_foreign_key "weekly_goals", "users"
end
