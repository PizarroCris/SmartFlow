json.array! @weekly_goals do |weekly_goal|
  json.extract! weekly_goal, :id, :title, :description, :target_date, :created_at
end