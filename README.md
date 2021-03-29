# README

## usersテーブル

|       Column       |  Type  | options                   |
| ------------------ | ------ | ------------------------- | 
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

_ has_many :purchase_records
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
| shipping_day_id        | integer    | null: false                   |
| price                  | integer    | null: false                   |
| user                   | references | foreign_key: true             |

### Association

_ belongs_to :user
_ has_many :comments
_ has_one :purchase_record


## purchase_recordsテーブル

|        Column       |    Type    | options            |
| ------------------- | ---------- | ------------------ |
| user                | references | foreign_key: true  |
| item                | references | foreign_key: true  |

### Association

_ belongs_to :user
_ belongs_to :item
_ has_one :delivery


## deliveriesテーブル

|      Column      |    Type    | options                       |
| ---------------- | ---------- | ----------------------------- |
| postal_code      | string     | null: false                   |
| shipping_area_id | integer    | null: false                   |
| municipalities   | string     | null: false                   |
| address          | string     | null: false                   |
| building         | string     |                               |
| phone_number     | string     | null: false                   |
| purchase_record  | references | foreign_key: true             |

### Association

_ belongs_to :purchase_record


## commentsテーブル

|  Column  |    Type    | options           |
| -------- | ---------- | ----------------- | 
| text     | string     | null: false       |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

_ belongs_to :user
_ belongs_to :item
