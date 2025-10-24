FactoryBot.define do
  factory :focus_session do
    association :user
    title { Faker::Lorem.word }
    duration_minutes { 40 }
    status { :completed }
  end
end