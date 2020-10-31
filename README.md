## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| jp_family_name     | string | null: false |
| jp_name            | string | null: false |
| family_name        | string | null: false |
| name               | string | null: false |
| birth_day          | date   | null: false |

has_many items
has_many purchases

## items テーブル

| Column             | Type       | Options            |
| ------------------ | ---------- | ------------------ |
| name               | string     | null: false        |
| text               | text       | null: false        |
| condition_id       | integer    | null: false        |
| shipping_cost_id   | integer    | null: false        |
| shipment_source_id | integer    | null: false        |
| shipping_days_id   | integer    | null: false        |
| category_id        | integer    | null: false        |
| user               | references | foreign_key: true  |

belongs_to user

## purchases テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

belongs_to item
has_one address

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| post_num      | text       | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building_name | string     | null: false | 
| phone_num     | string     | null: false |

belongs_to purchase