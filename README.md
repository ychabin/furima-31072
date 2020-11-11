## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| jp_family_name     | string | null: false |
| jp_name            | string | null: false |
| family_name        | string | null: false |
| name               | string | null: false |
| birth_day          | date   | null: false |

has_many items
has_many orders

## items テーブル

| Column             | Type       | Options            |
| ------------------ | ---------- | ------------------ |
| name               | string     | null: false        |
| text               | text       | null: false        |
| price              | integer    | null: false        |
| condition_id       | integer    | null: false        |
| shipping_cost_id   | integer    | null: false        |
| shipment_source_id | integer    | null: false        |
| shipping_day_id    | integer    | null: false        |
| category_id        | integer    | null: false        |
| user               | references | foreign_key: true  |

belongs_to user
has_one order

## orders テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

belongs_to user
belongs_to item
has_one address

## addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post_num      | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| house_num     | string     | null: false       |
| building_name | string     |                   |
| phone_num     | string     | null: false       |
| order         | references | foreign_key: true |

belongs_to order