# README

## アプリケーション名

MRI-guide

## URL

https://mri-guide.onrender.com

## テスト用アカウント

管理者 : yh@gmail.com , yh4410

テスト1 : a@a.a , aa1111 （a-hospitalに所属中）

テスト2 : b@b.b , bb1111 （所属施設なしの状態）

## 利用方法

・ユーザー登録

・ヘッダー右の「所属施設登録」ボタンから、自分の施設があるかを検索し、所属申請。なければ新規作成。

・トップページ左のサイドバーから、閲覧したい検査の項目を検索し、選択。なければ新規登録。

・検査項目の詳細が表示される。自施設のページであれば、撮影法の登録や編集、撮影時の備考の登録ができる。

同じ項目の撮影法を登録している施設が表示されるので、クリックするとその自施設の撮影法を閲覧できる。

他の施設を検索することもできる。

・ヘッダー右のドロップダウンメニューから、施設の検索や撮影時の画像のコントラストによる検索ができる。撮影法とコントラスト（高信号or低信号）の組み合わせで、その組み合わせを持った検査項目が表示され、クリックすればそのページに行ける。

### MRI検査のマニュアル

検査目的ごとに、撮影法を登録しておく

### 他院の撮影法の閲覧

自施設のマニュアルとしてだけでなく、他施設の撮影法を参考にできる

## アプリケーションを作成した背景

診療放射線疑義の業務の一つであるMRI検査は他の検査に比べて難易度が高く、知識や経験が不可欠である。

質の高い画像を提供するためには、様々なパラメーターを理解していなければならないが、初学者や若手には苦手意識のある人も多い分野である。

そこで、どんな検査目的の際にどんな撮影法を選択するのかを簡単に確認ができるアプリを制作することにした。

## 実装した機能についての画像やGIF及びその説明

[![Image from Gyazo](https://i.gyazo.com/f97eb02668ad0ee3bc6068005fff98b7.png)](https://gyazo.com/f97eb02668ad0ee3bc6068005fff98b7)

メイン機能のページ。ヘッダーには、トップ、マイページ、所属施設ページへのリンクを貼っていて、ドロップダウンメニューに各種検索ページへのリンクとログアウトボタンを設置。

左のサイドバーに、検査目的の検索フォームを設置して、ここから他の検査の検索や新規登録ができる。

右のサイドバーは、画像の検査詳細画面のみで設置していて、ここからその検査の撮影法を登録できる。登録した撮影法は、メインページの撮影法のところに反映される。

また、同じ検査項目に対して撮影法を設定している施設を表示している。自分の施設で出会ったことのない撮影や、自身のない検査では、他の施設の撮影法を参照することができる。

## 実装予定の機能

・月額会員制度

・上記に伴うセキュリティ周りの強化

・ユーザー同士のコミュニケーションツール

・使用機器による施設検索

・ログイン機能の最適化（SNS、メール認証等）

・スマホによる利用への適合

・ブロック、情報非公開などのプライバシー保護機能

・管理者権限の充実

・全体のデザイン性の向上

・いいね等の機能

・お気に入り機能

・非同期通信を拡充

・各種設定

・規約

## データベース設計

[![Image from Gyazo](https://i.gyazo.com/0fe58a089d6430487a775762ebb59c62.png)](https://gyazo.com/0fe58a089d6430487a775762ebb59c62)

## 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/74f02199b14b45ab51c08f8c8d699940.png)](https://gyazo.com/74f02199b14b45ab51c08f8c8d699940)

## 開発環境

・フロントエンド：Ruby on Rails v6.0.0

・バックエンド ：ruby v2.6.5

・インフラ ：Linux

・テスト ：rspec

・テスト実行方法：bundle exec rspec

・テキストエディタ：VScode

・タスク管理：GitHub Projects

## ローカルでの動作方法

以下のコマンドを順に実行。

% git clone https://github.com/Yoshito21/MRI-guide.git

% cd MRI-guide

% bundle install

% yarn install

## 工夫したポイント

・メインの機能は一つのページにまとめることで、クリックの回数を減らすようにした

・検査目的を検索する際、入力した条件で見つからなかった場合のみ新規登録ができるようにした。
また、新規登録ボタンをクリックした際は入力している情報をセッションに保存し、登録ページで再度入力しなくていいようにした。

・同じ施設が複数登録されるのを防ぐために、施設も検索後に見つからなかった場合のみ新規登録できるようにした。また、部外者が容易に所属することを防ぐため、二人目以降は申請・承認形式で所属する仕様にした。

・管理者を設定することにより、問い合わせや悪質なユーザーへの対応などができるようにした。

・JSやCSSを活用し、クリックしたときに何かしらのアクションが発生するところが分かりやすいようにした。また、デザインは全体的な統一感を持たせた。

























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
