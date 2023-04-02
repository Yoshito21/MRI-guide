# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| prefecture_id      | integer |             |
| occupation         | string  |             |
| manufacturer_id    | integer |             |
| machine_id         | integer |             |
| strength_id        | integer |             |

### Association

- has_many :user_cases
- has_many :cases, through: :user_cases
- has_many :comments
- belongs_to :manufacturer
- belongs_to :machine
- belongs_to :strength

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| case    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :case

## cases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| purpose | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- has_many :user_cases
- has_many :users, through: :user_cases
- has_many :comments
- has_many :case_imagings
- has_many :imagings, through: :case_imagings

 ###  user_cases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| case   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :case


## imagings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| sequence_id  | integer    | null: false                    |
| direction_id | integer    | null: false                    |
| CE_id        | integer    | null: false                    |
| note         | text       |                                |
| case         | references | null: false, foreign_key: true |

### Association

- belongs_to :sequence
- belongs_to :direction
- belongs_to :CE
- has_many :case_imagings
- has_many :cases, through: :case_imagings

## case_imagings テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| case    | references | null: false, foreign_key: true |
| imaging | references | null: false, foreign_key: true |

### Association

- belongs_to :case
- belongs_to :imaging
