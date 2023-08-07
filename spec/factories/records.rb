# FactoryBot.define do
#     factory :record do
#       name { "Sample Record" }
#       amount { 100 }
#       association :group, factory: :group
#       association :author, factory: :user
#     end
#   end

# spec/factories/records.rb
FactoryBot.define do
  factory :record do
    sequence(:name) { |n| "Record #{n}" }
    amount { 100 }
    association :group
    association :author, factory: :user # Add association with the User model as the author
  end
end
