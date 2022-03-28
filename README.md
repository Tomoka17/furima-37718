# README

## usersテーブル

| Column                | Type      | Option                 |
|-------------------------------------------------------------
| email                 | string    | null: false, ユニーク制約|
| encrypted_password    | string    | null: false            |
| nickname              | string    | null: false            |
| first_name            | string    | null: false            |
| last_name             | string    | null: false            |
| first_name_kana       | string    | null: false            |
| last_name_kana        | string    | null: false            |
| birth_day             | integer   | null: false            |

## Association
 has_many :items
 has_many :orders
 has_one :destination

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
| user_id     | references  | null: false, foreign_key: true  |
| item_id     | references  | null: false, foreign_key: true  |

## Association
 belongs_to :user
 belongs_to :item
 has_one :destination

## destination

| Column          | Type      | Option                            |
|-----------------------------------------------------------------|
| user_id         | references | null: false, foreign_key, true   |
| postal_code     | integer    | null: false                      |
| region          | string     | null: false                      |
| city            | string     | null: false                      |
| address         | text       | null: false                      |
| building_name   | text       | null: false                      |
| phone_number    | integer    | null: false                      |

## Association
 belongs_to :user
 belongs_to :order