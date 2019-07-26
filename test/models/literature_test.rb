# == Schema Information
#
# Table name: literatures
#
#  id         :bigint           not null, primary key
#  author     :string
#  keyword    :string
#  page       :integer
#  price      :integer
#  publish    :string
#  published  :text
#  remarks    :string
#  state      :string
#  title      :string
#  url        :text
#  volume     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LiteratureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
