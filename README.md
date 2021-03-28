# README

## usersテーブル

|       Column       |  Type  | options                   |
| ------------------ | ------ | ------------------------- | 
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name(カナ)    | string | null: false               |
| last_name(カナ)     | string | null: false               |
| birthday           | date   | null: false               |

### Association

_ has_many :buys
_ has_many :items
_ has_many :comments


## itemsテーブル

|        Column       |    Type    | options                       |
| ------------------- | ---------- | ----------------------------- |
| product_name        | string     | null: false                   |
| product_description | text       | null: false                   |
| product_category    | string     | null: false                   |
| product_status      | string     | null: false                   |
| shipping_fee burden | string     | null: false                   |
| shipping_area       | string     | null: false                   |
| shipping_days       | string     | null: false                   |
| price               | string     | null: false                   |
| user                | references | foreign_key: true             |

### Association

_belongs_to :users
_has_many :comments
_has_one :buys


## purchase_recordsテーブル

|        Column       |    Type    | options     |
| ------------------- | ---------- | ----------- |
| user                | string     | null: false |

### Association

belongs_to :users
_has_one :items
_has_one :deliveries


## deliveriesテーブル

|     Column     |    Type    | options                       |
| -------------- | ---------- | ----------------------------- |
| postal_code    | string     | null: false                   |
| prefectures_id | integer    | null: false                   |
| municipalities | string     | null: false                   |
| address        | string     | null: false                   |
| building       | string     |                               |
| phone_number   | string     | null: false                   |

### Association

_has_one :buys


## commentsテーブル

|  Column  |    Type    | options           |
| -------- | ---------- | ----------------- | 
| text     | string     | null: false       |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

belongs_to :users
belongs_to :items
