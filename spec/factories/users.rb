FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "name#{n}"}
    sequence(:email) { |n| "passion#{n}@example.com"}
    password "password"
    password_confirmation "password"
    administrator "false"
    # sequence(:use_id) { |n| "#{n}"}
  end
end
