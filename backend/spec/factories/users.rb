FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { Faker::Internet.unique.email }
    password { "password" }
    authentication_token { SecureRandom.urlsafe_base64(20) }
    admin { false }
  end
end