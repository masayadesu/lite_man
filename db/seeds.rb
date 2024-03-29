# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# if Rails.env == "development"

  url = ["https://www.amazon.co.jp/","https://www.oreilly.co.jp/index.shtml",""]
  keyword = ["宇宙","ruby","rails","Let's Groove","自動化 AI","レポート課題","論文"]
  state = ["読了","読中","未読","積読","購入希望"]

  Literature.create!(author: "", title: "Rails をはじめよう", volume: "", page: "",
                    url: "https://railsguides.jp/getting_started.html", published: "", publish: "Ruby on Rails ガイド", price: "",
                    keyword: "rails" , state: "読了", remarks: "WebApp作成の入門", user_id: "1")

  Literature.create!(author: "読書猿", title: "2013.10.01 問題解決のデッドロックを叩き壊す、とにかく考えを前に進めるための方法", volume: "", page: "",
                    url: "https://readingmonkey.blog.fc2.com/blog-entry-710.html", published: "2013-10", publish: "読書猿Classic: between / beyond readers", price: "",
                    keyword: "問題解決 ＮＭ法" , state: "読了", remarks: "問題解決 ブログ", user_id: "1")

  Literature.create!(author: "斎藤 康毅", title: "ゼロから作るDeep Learning", volume: "", page: "320",
                    url: "https://www.oreilly.co.jp/books/9784873117584/", published: "2016-09", publish: "オライリー・ジャパン", price: "2938",
                    keyword: "python deep Learning 機械学習" , state: "購入希望", remarks: "", user_id: "1")

  Literature.create!(author: "加藤 保子 友松 滋夫", title: "バナナの熟成に関する研究", volume: "8", page: "",
                    url: "http://hdl.handle.net/11334/1034", published: "1973-6", publish: "東海学園女子短期大学", price: "",
                    keyword: "バナナ 色調 変化 研究 レポート用" , state: "味読", remarks: "", user_id: "1")

  User.create!( name: "admin", email: "admin@gmoil.com", password: "password", password_confirmation: "password", administrator: true)
  User.create!( name: "user", email: "user@gmoil.com", password: "password", password_confirmation: "password", administrator: false)
  # User.create!( name: "user", email: "user@gmoil.com", password: "password", password_confirmation: "password", administrator: true)
  (3..50).each do |i|
    # User.create!( name: "user#{i}", email: "user#{i}@gmoil.com", password: "password", password_confirmation: "password", administrator: "#{i % 5 == 0? true:false}")
    User.create!( name: "user#{i}", email: "user#{i}@gmoil.com", password: "password", password_confirmation: "password", administrator: false)
  end

  (5..30).each do |i|
    Literature.create!(author: "著者#{i}", title: "title#{i}", volume: "#{i}", page: "#{i}",
                      url: "#{url.sample}", published: "#{i + 1950}", publish: "☓☓☓社#{i}", price: "#{i * 100}",
                      keyword: "#{keyword.sample}" , state: "#{state.sample}", remarks: "*******#{i}", user_id: "1")
  end
  (31..50).each do |i|
    Literature.create!(author: "著者#{i}", title: "title#{i}", volume: "#{i}", page: "#{i}",
                      url: "#{url.sample}", published: "#{i + 1950}", publish: "☓☓☓社#{i}", price: "#{i * 100}",
                      keyword: "#{keyword.sample}" , state: "#{state.sample}", remarks: "*******#{i}", user_id: "2")
  end

  (51..100).each do |i|
    Literature.create!(author: "著者#{i}", title: "title#{i}", volume: "#{i}", page: "#{i}",
                      url: "#{url.sample}", published: "#{i + 1950}", publish: "☓☓☓社#{i}", price: "#{i * 100}",
                      keyword: "#{keyword.sample}" , state: "#{state.sample}", remarks: "*******#{i}", user_id: "#{rand(3..20)}")
  end
