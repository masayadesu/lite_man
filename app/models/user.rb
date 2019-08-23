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

class User < ApplicationRecord
  has_secure_password
  has_many :literatures, dependent: :destroy


  validates :name,
    presence: true,
    uniqueness: true,
    length: {maximum: 20},
    format: {
      with: /\A[A-Za-z0-9]+\z/,
      message: 'は半角英数字で入力してください',
      allow_blank: true
    }

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: true },
    length: {maximum: 50},
    format: {
      with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
      allow_blank: true
    }
  # validates :password, length: { minimum: 6}
  # validates :password, length: { minimum: 6}, on: :create, allow_blank: true
  # validates :password, length: { minimum: 6}, on: :update, allow_blank: true
  validates :password,
    presence: true,
    length: { minimum: 6},
    allow_blank: true

  attr_accessor :current_password
  validates :password, presence: { if: :current_password }

  paginates_per 20

  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("name LIKE ?","%#{query}%")
      end
      rel
    end
  end
end
