## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| real_name | text   | null: false |
| birth_day | text   | null: false |

## items テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| name      | string     | null: false |
| text      | text       | null: false |
| user      | references |             |

## purchases テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| price       | integer    | null: false |
| user        | references |             |
| item        | references |             |

## addresses テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| address     | text       | null: false |
| user        | references |             |
| item        | references |             |
| purchase    | references |             |