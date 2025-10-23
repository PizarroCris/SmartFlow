json.array! @weekly_goals do |weekly_goal|
  json.extract! weekly_goal, :title, :description, :target_date
end