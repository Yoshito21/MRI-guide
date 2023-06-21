# テーブル設計

## occupations テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| post_code     | string  | null: false |
| prefecture_id | integer | null: false |
| municipality  | string  |             |
| address       | string  |             |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Association

- has_many :occupation_membership
- has_many :users, through: :user_cases
- has_many :conditions
- has_many :machines
- has_many :occupation_machines
- has_one :remark


## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| prefecture2_id     | integer    | null: false                    |
| occupation         | references | null: false, foreign_key: true |

### Association

- has_many :occupation_memberships
- has_many :contacts
- belongs_to :occupation

## occupation_memberships テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| status     | string     |                                |
| occupation | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :occupation
- belongs_to :user

## machines テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| strength_id     | integer    | null: false                    |
| manufacturer_id | integer    | null: false                    |
| occupation      | references | null: false, foreign_key: true |

### Association

- has_many :occupation_machines
- has_many :occupations, through_occupation_machines

## occupation_machines テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| occupation | references | null: false, foreign_key: true |
| machine    | references | null: false, foreign_key: true |

### Association

- belongs_to :occupation
- belongs_to :machine

## contacts テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| contents | text       | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## imagings テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| site_id        | integer | null: false |
| purpose        | string  | null: false |
| identification | text    |             |
| symptoms       | text    |             |
| treatment      | text    |             |
| comment        | text    |             |

### Association

- has_many :conditions
- has_many :imaging_heights
- has_many :heights, through: :imaging_heights
- has_many :imaging_middles
- has_many :middles, through: :imaging_middles
- has_many :imaging_lows
- has_many :lows, through: :imaging_lows
- has_many :conditions
- has_one  :remark

 ###  conditions テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| location_id    | integer    | null: false                    |
| contrast_id    | integer    | null: false                    |
| suppression_id | integer    | null: false                    |
| enhance_id     | integer    | null: false                    |
| occupation     | references | null: false, foreign_key: true |
| imaging        | references | null: false, foreign_key: true |

### Association

- belongs_to :occupation
- belongs_to :imaging

 ###  remarks テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| content    | integer    | null: false                    |
| occupation | references | null: false, foreign_key: true |
| imaging    | references | null: false, foreign_key: true |

### Association

- belongs_to :occupation
- belongs_to :imaging

## heights テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :imaging_heights
- has_many :imagings, through: :imaging_heights

## imaging_heights テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| height  | references | null: false, foreign_key: true |
| imaging | references | null: false, foreign_key: true |

### Association

- belongs_to :height
- belongs_to :imaging

## middles テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :imaging_middles
- has_many :imagings, through: :imaging_middles

## imaging_middles テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| middle  | references | null: false, foreign_key: true |
| imaging | references | null: false, foreign_key: true |

### Association

- belongs_to :middle
- belongs_to :imaging

## lows テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :imaging_lows
- has_many :imagings, through: :imaging_lows

## imaging_lows テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| low     | references | null: false, foreign_key: true |
| imaging | references | null: false, foreign_key: true |

### Association

- belongs_to :low
- belongs_to :imaging
