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
  validates :author,length:{maximum: 50}
  validates :title,length:{maximum: 100}
  validates :volume,length:{maximum: 10}
  validates :page,length:{maximum: 10}
  validates :url,length:{maximum: 100}
  validates :published,length:{maximum: 10}
  validates :publish,length:{maximum: 50}
  validates :price,length:{maximum: 5}
  validates :keyword,length:{maximum: 50}
  validates :state,length:{maximum: 10}
  validates :remarks,length:{maximum: 5000}

  # scope :search_literature, -> { where('author LIKE ? OR title LIKE ? publish LIKE ?  LIKE ? state LIKE ? remarks LIKE ?',
  #    "%#{params[:name_key]}%","%#{params[:name_key]}%","%#{params[:name_key]}%","%#{params[:name_key]}%","%#{params[:name_key]}%","%#{params[:name_key]}%") }

  class << self
  def search(query)
    rel = order(updated_at: "DESC")
    if query.present?
      rel = rel.where(
      "author LIKE ? OR title LIKE ? OR publish LIKE ? OR keyword LIKE ? OR state LIKE ? OR remarks LIKE ?",
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
    end
    rel
  end
end


end
