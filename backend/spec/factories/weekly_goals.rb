FactoryBot.define do
  factory :weekly_goal do
    association :user
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    target_date { 1.week.from_now }
  end
end