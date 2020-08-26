# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| familiy_name     | string | null: false |
| first_name       | string | null: false |
| familiy_name_k   | string | null: false |
| first_name_k     | string | null: false |
| email            | string | null: false |
| password         | string | null: false |

### Association

- has_many :items
- has_one :customer

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| image          | string     | null: false                    |
| content        | text       | null: false                    |
| price          | integar    | null: false                    |
| user           | integar    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :customer

## customer テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user    | integar | null: false, foreign_key: true |
| item    | integar | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| city         | string     | null: false                    |
| number       | string     | null: false                    |
| phone_number | string     | null: false                    |
| customer     | integar    | null: false, foreign_key: true |

### Association

- belongs_to :customer