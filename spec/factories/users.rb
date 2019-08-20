# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  administrator   :boolean          default(FALSE), not null
#  email           :string
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#

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
