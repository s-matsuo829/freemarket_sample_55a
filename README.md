# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|image|string||
|email|string|null: false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|family_kana|string|null: false|
|birthday|date|null: false|
|postalcode|string|null: false|
|address_prefecture|string|null: false|
|address_city|string|null: false|
|address_number|string|null: false|
|address_building|string|null: false|
|phone_number|string|null: false, unique: true|
|provider|string||
|uid|string||

### Association
- has_many :items
- has_one :card
- has_many :likes, dependent: :destroy
- has_many :buyer_tradings, class_name: 'Trading', :foreign_key => 'buyer_id'

- validates :nickname, presence: true
- validates :email, presence: true, uniqueness: true
- validates :first_name, presence: true
- validates :last_name, presence: true
- validates :first_kana, presence: true
- validates :last_kana, presence: true
- validates :birthday, presence: true
- validates :postalcode, presence: true
- validates :address_prefecture, presence: true
- validates :address_city, presence: true
- validates :address_number, presence: true
- validates :address_building, presence: true
- validates :phone_number, presence: true, uniqueness: true



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false, index: true|
|description|text|null: false, index: true|
|item_status|integer|null: false|
|payment|integer|null: false|
|delivery_type|integer|null: false|
|delivery_region|integer|null: false|
|delivery_days|integer|null: false|
|price|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- has_one :trading
- belongs_to :user
- has_many :likes, dependent: :destroy

- validates :image, presence: true
- validates :name, presence: true
- validates :description, presence: true
- validates :item_status, presence: true
- validates :payment, presence: true
- validates :delivery_type, presence: true
- validates :delivery_region, presence: true
- validates :delivery_days, presence: true
- validates :price, presence: true
- validates :user_id, presence: true



## tradingsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|transaction|integer|null: false|
|rating|integer|null: false|
|buyer_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id

- validates :item_id, presence: true
- validates :transaction, presence: true
- validates :rating, presence: true
- validates :buyer_id, presence: true



## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

- validates :user_id, presence: true
- validates :customer_id, presence: true
- validates :card_id, presence: true



## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

- validates :user_id, presence: true
- validates :item_id, presence: true
