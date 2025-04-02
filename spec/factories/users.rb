FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    nickname { "テスト太郎" }
    password { "password" }
    password_confirmation { "password" }
  end
end
