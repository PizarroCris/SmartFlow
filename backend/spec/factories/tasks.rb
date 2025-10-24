FactoryBot.define do
  factory :task do
    association :user
    association :weekly_goal
    title { Faker::Quote.most_interesting_man_in_the_world }
    status {:incomplete}
    priority {:medium}
  end
end