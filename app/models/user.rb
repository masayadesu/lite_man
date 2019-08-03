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
      with: /\A[a-z0-9]+\z/,
      message: 'は小文字英数字で入力してください'
    }
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: true },
    length: {maximum: 50},
    format: {
      with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      # message: 'Emailの書式が不正です'
    }
  # validates :password, length: { minimum: 6}, on: :create
  # validates :password, length: { minimum: 6}, on: :update, allow_blank: true

  attr_accessor :current_password
  validates :password, presence: { if: :current_password }

  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("name LIKE ?","%#{query}%")
      end
      rel
    end
  end

  # def literatures
  #   return Literarure.where(user_id: self.id)
  # end
end
