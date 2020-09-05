# README
# テーブル設計

## users テーブル

| Column                   | Type    | Options     |
| ------------------------ | ------- | ----------- |
| nickname                 | string  | null: false |
| email                    | string  | null: false |
| password                 | integer | null: false |
| password_confirmation    | integer | null: false |
| family_name              | string  | null: false |
| first_name               | string  | null: false |
| kana_family_name         | string  | null: false |
| kana_first_name          | string  | null: false |
| bithday_id (Active Hush) | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                         | Type       | Options                        |
| ------------------------------ | ---------- | ------------------------------ |
| image                          | string     | null: false                    |
| name                           | string     | null: false                    |
| description                    | string     | null: false                    |
| category_id (Active Hush)      | integer    | null: false                    |
| stauts_id (Active Hush)        | integer    | null: false                    |
| shipping_fee_id (Active Hush)  | integer    | null: false                    |
| shipping_from_id (Active Hush) | integer    | null: false                    |
| shipping_date_id (Active Hush) | integer    | null: false                    |
| price                          | integer    | null: false                    |
| user                           | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_adresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | integer    | null: true                     |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase