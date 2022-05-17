## usersテーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| name                | string  | null: false |
| image               | string  ｜
| profile             | text    ｜
| email               | string  | null: false | unique: true |
| encrypted_password  | string  | null: false |

* image,profile は空欄可
* image はURLを保存するため string型に指定

### Association
- has_many :items
- has_many :comments
- has_many :favorites



## itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| age            | integer    | null: false |
| text           | text       | null: false |
| material       | text       | 
| making         | text       |
| user           | references | foreign_key: true | null: false |

* image = Active Storage 使用のためカラム追加なし
* material,making は空欄可

### Association
- belongs_to :user
- has_one_attached :image
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy


## commentsテーブル

| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------  |
| text   | text       | null: false                     |
| user   | references | foreign_key: true | null: false |
| item   | references | foreign_key: true | null: false |

### Association
- belongs_to :user
- belongs_to :item

## favoritesテーブル

| Column              | Type              | Options                        |
| ------------------  | ----------------- | ------------------------------ |
| user   | references | foreign_key: true | null: false                    |
| item   | references | foreign_key: true | null: false                    |


### Association
- belongs_to :user
- belongs_to :item

