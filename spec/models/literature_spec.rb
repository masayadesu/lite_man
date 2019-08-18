require 'rails_helper'

RSpec.describe Literature, type: :model do
  it "著者名は50文字以内でなければ無効な状態であること" do
  literature = Literature.new(author: "#{'a'* 51}")
  literature.valid?
  expect(literature.errors[:author]).to include("は50文字以内で入力してください")
end

it "タイトルがなければ無効な状態であること" do
  literature = Literature.new(title: nil)
  literature.valid?
  expect(literature.errors[:title]).to include("を入力してください")
end

it "タイトルは100文字以内でなければ無効な状態であること" do
  literature = Literature.new(title: "#{'a'* 101}")
  literature.valid?
  expect(literature.errors[:title]).to include("は100文字以内で入力してください")
end

it "巻号は10文字以内でなければ無効な状態であること" do
  literature = Literature.new(volume: "#{'a'* 11}")
  literature.valid?
  expect(literature.errors[:volume]).to include("は10文字以内で入力してください")
end

it "頁は10文字以内でなければ無効な状態であること" do
  literature = Literature.new(page: "#{'a'* 11}")
  literature.valid?
  expect(literature.errors[:page]).to include("は10文字以内で入力してください")
end

it "URLは100文字以内でなければ無効な状態であること" do
  literature = Literature.new(url: "#{'a'* 101}")
  literature.valid?
  expect(literature.errors[:url]).to include("は100文字以内で入力してください")
end

it "出版年/掲載年は10文字以内でなければ無効な状態であること" do
  literature = Literature.new(published: "#{'a'* 11}")
  literature.valid?
  expect(literature.errors[:published]).to include("は10文字以内で入力してください")
end

it "出版社/サイト名は50文字以内でなければ無効な状態であること" do
  literature = Literature.new(publish: "#{'a'* 51}")
  literature.valid?
  expect(literature.errors[:publish]).to include("は50文字以内で入力してください")
end

it "金額は5文字以内でなければ無効な状態であること" do
  literature = Literature.new(price: "#{'1'* 6}")
  literature.valid?
  expect(literature.errors[:price]).to include("は5文字以内で入力してください")
end

it "キーワードは50文字以内でなければ無効な状態であること" do
  literature = Literature.new(keyword: "#{'a'* 51}")
  literature.valid?
  expect(literature.errors[:keyword]).to include("は50文字以内で入力してください")
end

it "備考/要約は5000文字以内でなければ無効な状態であること" do
  literature = Literature.new(remarks: "#{'a'* 5001}")
  literature.valid?
  expect(literature.errors[:remarks]).to include("は5000文字以内で入力してください")
end
end
