FactoryBot.define do
  factory :group do
    name { 'Sample Group' }
    icon { 'https://example.com/sample_icon.jpg' }
    association :user, factory: :user
  end
end
