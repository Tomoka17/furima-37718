# README

## usersテーブル

| Column                | Type      | Option                   |
|--------------------------------------------------------------|
| email                 | string    | null: false, unique: true|
| encrypted_password    | string    | null: false              |
| nickname              | string    | null: false              |
| first_name            | string    | null: false              |
| last_name             | string    | null: false              |
| first_name_kana       | string    | null: false              |
| last_name_kana        | string    | null: false              |
| birthday              | date      | null: false              |

## Association
 has_many :items
 has_many :orders

## itemsテーブル

| Column            | Type       | Option                         |
|-----------------------------------------------------------------|
| name              | string     | null: false                    |
| price             | integer    | null: false                    |
| user_id           | references | null: false, foreign_key: true |
| description       | text       | null: false                    |
| category          | string     | null: false                    |
| item_status       | string     | null: false                    |
| freight           | string     | null: false                    |
| ship_from         | string     | null: false                    |
| day_to_ship       | string     | null: false                    |

## Association
 belongs_to :user
 has_one :order


## ordersテーブル

| Column      | Type        | Option                          |
|-------------------------------------------------------------|
| user        | references  | null: false, foreign_key: true  |
| item_id     | references  | null: false, foreign_key: true  |

## Association
 belongs_to :user
 belongs_to :item
 has_one :destination

## destination

| Column          | Type      | Option                            |
|-----------------------------------------------------------------|
| user            | references | null: false, foreign_key, true   |
| postal_code     | string     | null: false                      |
| region          | string     | null: false                      |
| city            | string     | null: false                      |
| address         | string     | null: false                      |
| building_name   | string     | null: false                      |
| phone_number    | string     | null: false                      |
