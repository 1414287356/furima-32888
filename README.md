# README

## usersテーブル

|  Column  |  Type  | options     |
| -------- | ------ | ----------- | 
| Nickname | string | null: false |
| Email    | string | null: false |
| Password | string | null: false |
| NAME     | string | null: false |
| Birthday | string | null: false |

### Association

_ has_many :Buys
_ has_many :Items
_ has_many :Comments


## Itemsテーブル

|        Column       |    Type    | options                       |
| ------------------- | ---------- | ----------------------------- |
| Product-image       |            | implementation: ActiveStorage |
| Product-name        | string     | null: false                   |
| Product-description | text       | null: false                   |
| Product-details     | select     | null: false                   |
| Price               | select     | null: false                   |
| user                | references | foreign_key: true             |

### Association

_belongs_to :Users
_has_many :Comments
_has_one_attached :Buys


## Buysテーブル

|        Column       |    Type    | options     |
| ------------------- | ---------- | ----------- |
| Card-information    | string     | null: false |
| Time-limit          | string     | null: false |
| Security-cord       | string     | null: false |

### Association

belongs_to :Users
_has_one_attached :Items
_has_one_attached :Delivery


## Deliveryテーブル

|     Column     |    Type    | options                       |
| -------------- | ---------- | ----------------------------- |
| Postal-code    | string     | null: false                   |
| Prefectures    | select     | null: false                   |
| Municipalities | string     | null: false                   |
| Address        | string     | null: false                   |
| Building       | string     |                               |
| Phone-number   | string     | null: false                   |

### Association

_has_one_attached :Buys


## Commentsテーブル

|  Column  |    Type    | options           |
| -------- | ---------- | ----------------- | 
| text     | string     | null: false       |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

belongs_to :Users
belongs_to :Items
