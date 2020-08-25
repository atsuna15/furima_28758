# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one :customer

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| image          | string     | null: false                    |
| content        | text       | null: false                    |
| price          | string     | null: false                    |
| category       | string     | null: false                    |
| status         | string     | null: false                    |
| delivery_price | string     | null: false                    |
| region         | string     | null: false                    |
| day            | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :customer

## customer テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address
- has_one :credit

## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| number       | string     | null: false                    |
| phone_number | string     | null: false                    |
| customer     | references | null: false, foreign_key: true |

### Association

- belongs_to :customer

## credit テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| number   | string     | null: false                    |
| date     | string     | null: false                    |
| code     | string     | null: false                    |
| customer | references | null: false, foreign_key: true |
 
### Association

- belongs_to :customer
