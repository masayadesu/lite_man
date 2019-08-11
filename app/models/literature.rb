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

class Literature < ApplicationRecord
  belongs_to :user, optional: true

  # scope :my_bunken, -> { where(user_id: :current_user) }

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
  validates :user_id, {presence: true}

# per_page = params[:per_page]
# page_per ||= 5
 #  paginates_per  "#{page_per}"
  paginates_per  20
  # default_per_page 20
  # binding.pry
  # default_per_page = 10
  # paginates_per session[:change_number]

  class << self
    def search(query)
      # rel = order(updated_at: "DESC")
      rel = order(:id)
      if query.present?
        rel = rel.where(
        "author LIKE ? OR title LIKE ? OR url LIKE ? OR published LIKE ? OR publish LIKE ? OR keyword LIKE ? OR state LIKE ? OR remarks LIKE ?",
        "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end





end
