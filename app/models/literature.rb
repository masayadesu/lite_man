# == Schema Information
#
# Table name: literatures
#
#  id         :bigint           not null, primary key
#  author     :string
#  title      :string
#  volume     :string
#  page       :integer
#  url        :text
#  published  :date
#  publish    :string
#  price      :integer
#  keyword    :string
#  state      :string
#  remarks    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Literature < ApplicationRecord
  validates :author,length:{maximum: 30}
  validates :title,length:{maximum: 30}
  validates :volume,length:{maximum: 10}
  validates :page,length:{maximum: 10}
  validates :url,length:{maximum: 100}
  validates :published,length:{maximum: 10}
  validates :publish,length:{maximum: 30}
  validates :price,length:{maximum: 10}
  validates :keyword,length:{maximum: 30}
  validates :state,length:{maximum: 10}
  validates :remarks,length:{maximum: 5000}
end
