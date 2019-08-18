FactoryBot.define do
  factory :user do
    # name "passion"
    sequence(:name) { |n| "name#{n}"}
    sequence(:email) { |n| "passion#{n}@example.com"}
    password "password "
    administrator "false"
  end
end
