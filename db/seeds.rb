# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == "development"

  Literature.create(author: "", title: "Rails をはじめよう", volume: "", page: "",
                    url: "https://railsguides.jp/getting_started.html", published: "", publish: "Ruby on Rails ガイド", price: "",
                    keyword: "rails" , state: "読了", remarks: "WebApp作成の入門")

  Literature.create(author: "読書猿", title: "2013.10.01 問題解決のデッドロックを叩き壊す、とにかく考えを前に進めるための方法", volume: "", page: "",
                    url: "https://readingmonkey.blog.fc2.com/", published: "2013-10", publish: "読書猿Classic: between / beyond readers", price: "",
                    keyword: "問題解決 ＮＭ法" , state: "読了", remarks: "問題解決 ブログ")

  Literature.create(author: "斎藤 康毅", title: "ゼロから作るDeep Learning", volume: "", page: "320",
                    url: "https://www.oreilly.co.jp/books/9784873117584/", published: "2016-09", publish: "オライリー・ジャパン", price: "2938",
                    keyword: "python deep Learning 機械学習" , state: "購入希望", remarks: "")

  Literature.create(author: "加藤 保子 友松 滋夫", title: "バナナの熟成に関する研究", volume: "8", page: "",
                    url: "http://hdl.handle.net/11334/1034", published: "1973-6", publish: "東海学園女子短期大学", price: "",
                    keyword: "バナナ 色調 変化 研究" , state: "未読", remarks: "")


url = ["https://www.amazon.co.jp/","https://www.oreilly.co.jp/index.shtml",""]
keyword = ["宇宙","ruby","rails","neko","自動化 AI"]
state = ["読了","読中","未読","購入希望"]

  (4..50).each do |i|
    Literature.create(author: "著者#{i}", title: "title#{i}", volume: "#{i}", page: "#{i}",
                      url: "#{url.sample}", published: "#{i}", publish: "☓☓☓社#{i}", price: "#{i * 100}",
                      keyword: "#{keyword.sample}" , state: "#{state.sample}", remarks: "*******#{i}")
  end
end
