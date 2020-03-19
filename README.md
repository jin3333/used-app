# used DB設計
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


## genreテーブル
|------|----|-------|
|name|string|null: false|
### Association
- has_many :posts, through: :posts_genre
- has_many :posts_genre
- has_many :posts


## itemsテーブル
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
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post

