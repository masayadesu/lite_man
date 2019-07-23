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

require 'test_helper'

class LiteratureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
