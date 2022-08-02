# テーブル設計

## usersテーブル

| Column             | Type   | Options
| ------------------ | ------ | --------------------------
| nickname           | string | null: false
| email              | string | null: false, unique: true
| encrypted_password | string | null: false
| last_name          | string | null: false
| first_name         | string | null: false
| last_name_kana     | string | null: false
| first_name_kana    | string | null: false
| birth_day          | date   | null: false

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column                    | Type       | Options
| ------------------------- | ---------- | -------------------------------
| item_name                 | string     | null: false
| item_info                 | text       | null: false
| item_category             | text       | null: false
| item_sales_status         | string     | null: false
| item_shipping_fee_status  | string     | null: false
| item_prefecture           | string     | null: false
| item_scheduled_delivery   | string     | null: false
| item_price                | integer    | null: false
| user                      | references | null: false, foreign_key: true

### Association
- has_one :order
- belongs_to :user

## ordersテーブル

| Column          | Type       | Options
| ----------------| ---------- | --------------------------------
| card_number     | integer    | null: false
| card_exp_month  | date       | null: false
| card_exp_year   | date       | null: false
| card_cvc        | integer    | null: false
| item            | references | null: false, foreign_key: true
| user            | references | null: false, foreign_key: true

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippingsテーブル

| Column                    | Type       | Options
| ------------------------- | ---------- | -------------------------------
| postal_code               | integer    | null: false
| prefecture                | string     | null: false
| city                      | string     | null: false
| addresses                 | string     | null: false
| building                  | string     |
| phone_number              | string     | null: false
| order                     | references | null: false, foreign_key: true

### Association
- belongs_to :order