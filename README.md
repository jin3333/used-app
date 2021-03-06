# アプリ名 
## USED
# 概要
このアプリではファッション投稿サイトとフリマサイトを掛け合わせたようなサイトです。
このアプリではご自身のコーディネートとご自身の売りたい服を一緒に投稿できるサービスです。
# 制作背景(意図)
　自分の服を本当に服が好きな人にかってもらいたかったからです。私自信服に興味があるのですが、
　いらなくなった服をフリマアプリに出すのは少し抵抗があるので、古着専用のフリマアプリを作りたかったからです。
　その中で自分のコーディネートを載せれたら着こなしをイメージしやすいのでコーディネート画像をトップに持ってきました。
# DEMO
## トップページの画像です
　https://gyazo.com/0368268ba9af55833e6775623c070680
## 実際に使ったGIFです
  https://i.gyazo.com/485e56811857e52af5f3d7a3e78205f4.gif
# 実装予定の内容
  商品の出品、購入機能です。まだサービスの大元のフリマ要素を実装できていないので実装予定です。
# 本番環境のURLとテストアカウント
　URL:http://54.250.62.142/
  アカウント
  email: a@a.com
  Password: test1111
# DB設計
## posts_genreテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|genre_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :genre

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :comments
- has_many :posts


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text||text|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
- has_many   :comments
- has_many :genres, through: :posts_genre
- has_many   :posts_genre


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|brand|string|null: false|
|post_id|integer|null: false, foreign_key: true|
|saler_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post

