## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
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

| Column          | Type       | Options            |
| ---------       | ---------- | ------------------ |
| name            | string     | null: false        |
| text            | text       | null: false        |
| condition       | text       | null: false        |
| shipping_cost   | text       | null: false        |
| shipment_source | text       | null: false        |
| shipping_days   | text       | null: false        |
| category        | text       | null: false        |
| user            | references | dependent: :destroy|

belongs_to user

## purchases テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| user        | references |             |
| item        | references |             | 

belongs_to item
has_one address

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| post_num      | text       | null: false |
| prefecture    | text       | null: false |
| city          | text       | null: false |
| address       | text       | null: false |
| building_name | text       | null: false | 
| phone_num     | text       | null: false |

belongs_to purchase