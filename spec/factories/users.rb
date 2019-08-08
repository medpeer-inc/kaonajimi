FactoryBot.define do
  factory :user do
    master_group
    profile_text { "よろしくおねがいします" }
    first_name { "太郎" }
    last_name { "山田" }
    nearest_station { "東銀座" }
    sequence(:email) { |n| "dummy#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
