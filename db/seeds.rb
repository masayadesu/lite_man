# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == "development"

url = ["http//******",""]
keyword = ["宇宙","ruby","rails","neko"]
state = ["読了","読中","未読","購入希望"]

  (1..50).each do |i|
    Literature.create(author: "著者#{i}", title: "title#{i}", volume: "#{i}", page: "#{i}",
                      url: "#{url.sample}", published: "#{i}", publish: "☓☓☓社#{i}", price: "#{i * 100}",
                      keyword: "#{keyword.sample}" , state: "#{state.sample}", remarks: "*******#{i}")
  end
end
