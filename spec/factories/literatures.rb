# == Schema Information
#
# Table name: literatures
#
#  id         :bigint           not null, primary key
#  author     :string
#  keyword    :string
#  page       :string
#  price      :integer
#  publish    :string
#  published  :string
#  remarks    :text
#  state      :string
#  title      :string
#  url        :text
#  volume     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

FactoryBot.define do
  factory :literature do
    
  end
end
