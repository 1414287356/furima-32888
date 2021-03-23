# README

## usersテーブル

|   Column    |  Type  |  options    |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| name(全角)   | string | null: false |
| name(全角カナ)| string | null: false |
| birthday    | string? | null: false |

### Association

_ has_many :comments
_ has_many :exhibition


## commentsテーブル

|  Column    |  Type      |  options    |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| exhibition | references |             |

### Association

_belongs_to :users
_belongs_to :prototypes


## prototypesテーブル

|   Column   |  Type      |  options                      |
| ---------- | ---------- | ----------------------------- |
| title      | string     | null: false                   |
| catch_copy | text       | null: false                   |
| concept    | text       | null: false                   |
| image      |            | implementation: ActiveStorage |
| user       | references |                               |

### Association

_has_many :comments
_belongs_to :users
