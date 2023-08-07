FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "John Doe #{n}" }
    sequence(:email) { |n| "john.doe#{n}@example.com" }
    password { 'password' }
  end
end
