json.extract! user_history_detail, :id, :user_history_id, :symtptom_id, :created_at, :updated_at
json.url user_history_detail_url(user_history_detail, format: :json)
