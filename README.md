# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| familiy_name     | string  | null: false |
| first_name       | string  | null: false |
| familiy_name_k   | string  | null: false |
| first_name_k     | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| birth            | date    | null: false |

### Association

- has_many :items
- has_many :customer

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| image          | string     | null: false                    |
| content        | text       | null: false                    |
| price          | integer    | null: false                    |
| category       | integer    | null: false                    |
| status         | integer    | null: false                    |
| delivery_price | integer    | null: false                    |
| region         | integer    | null: false                    |
| day            | integer    | null: false                    |
| user_id        | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :customer

## customer テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| number       | string     | null: false                    |
| building_name| string     |                                |
| phone_number | string     | null: false                    |
| customer_id  | integer    | null: false, foreign_key: true |

### Association

- belongs_to :customer