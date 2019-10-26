# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  nickname: 'ゲストユーザー',
  email: 'guest-user@guest.com',
  password: 'guest123',
  password_confirmation: 'guest123'
)

Book.create!(
  [
    {
      title: "プロを目指す人のためのRuby入門",
      author: "伊藤淳一（プログラミング）",
      image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/3977/9784774193977.jpg?_ex=200x200",
      url: "https://books.rakuten.co.jp/rb/15209044/",
      isbn: "9784774193977"
    },
    {
      title: "JavaScript本格入門改訂新版",
      author: "山田祥寛",
      image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/4111/9784774184111.jpg?_ex=200x200",
      url: "https://books.rakuten.co.jp/rb/14433718/",
      isbn: "9784774184111"
    }
  ]
)

Review.create!(
  [
    {
      purpose: "sample_ruby",
      rate: 5,
      review_status: 1,
      user_id: 1,
      book_id: 1
    },
    {
      purpose: "sample_JavaScript",
      rate: 5,
      review_status: 1,
      user_id: 1,
      book_id: 2
    }
  ]
)
