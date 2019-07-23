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
|provider|string||
|uid|string||

### Association
- has_one :address
- has_many :items
- has_one :card
- has_many :likes, dependent: :destroy
- has_many :buyer_tradings, class_name: 'Trading', :foreign_key => 'buyer_id'

- validates :email, presence: true, uniqueness: true
- with_options presence: true do
-   validates :nickname
-   validates :first_name
-   validates :last_name
-   validates :first_kana
-   validates :last_kana
-   validates :birthday
- end



## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postalcode|string|null: false|
|address_prefecture|string|null: false|
|address_city|string|null: false|
|address_number|string|null: false|
|address_building|string|null: false|
|phone_number|string|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

- validates :phone_number, presence: true, uniqueness: true
- with_options presence: true do
-   validates :postalcode
-   validates :address_prefecture
-   validates :address_city
-   validates :address_number
-   validates :address_building
- end



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

- with_options presence: true do
-   validates :image
-   validates :name
-   validates :description
-   validates :item_status
-   validates :payment
-   validates :delivery_type
-   validates :delivery_region
-   validates :delivery_days
-   validates :price
- end



## tradingsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|transaction|integer|null: false|
|rating|integer||
|buyer_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id

- validates :transaction, presence: true



## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user



## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
