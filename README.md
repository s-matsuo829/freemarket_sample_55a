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
|email|string|null: false, unique: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_kana|string|null: false|
|family_kana|string|null: false|
|birthday|date|null: false|
|postalcode|integer|null: false|
|address_ken|string|null: false|
|address_city|string|null: false|
|address_number|string|null: false|
|address_building|string|null: false|
|phone_number|string|null: false, unique: true|
|send_postalcode|integer|null: false|
|send_address_ken|string|null: false|

### Association
- has_many :groups, through: :members
- has_many :messages
- has_many :members