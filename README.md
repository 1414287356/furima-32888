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

|        Column          |    Type    | options                       |
| ---------------------- | ---------- | ----------------------------- |
| product_name           | string     | null: false                   |
| product_description    | text       | null: false                   |
| product_category_id    | integer    | null: false                   |
| product_status_id      | integer    | null: false                   |
| shipping_fee_burden_id | integer    | null: false                   |
| shipping_area_id       | integer    | null: false                   |
| shipping_days_id       | integer    | null: false                   |
| price                  | integer    | null: false                   |
| user                   | references | foreign_key: true             |

### Association

_belongs_to :user
_has_many :comments
_has_one :buy


## purchase_recordsテーブル

|        Column       |    Type    | options     |
| ------------------- | ---------- | ----------- |
| user                | references | null: false |
| item                | references | null: false |

### Association

belongs_to :user
_has_one :item
_has_one :delivery


## deliveriesテーブル

|      Column      |    Type    | options                       |
| ---------------- | ---------- | ----------------------------- |
| postal_code      | string     | null: false                   |
| shipping_area_id | integer    | null: false                   |
| municipalities   | string     | null: false                   |
| address          | string     | null: false                   |
| building         | string     |                               |
| phone_number     | string     | null: false                   |

### Association

_has_one :buy


## commentsテーブル

|  Column  |    Type    | options           |
| -------- | ---------- | ----------------- | 
| text     | string     | null: false       |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

belongs_to :user
belongs_to :item
