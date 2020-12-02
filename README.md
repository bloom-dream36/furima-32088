## Users

|Column                |Type           |Options       |
|----------------------|---------------|--------------|
| nickname             |  string       | null:false   |
| email                |  string       | null:false   |
| encrypted_password   |  string       | null:false   |
| first_name           |  string       | null:false   |
| last_name            |  string       | null:false   |
|kana_first            |  string       | null:false   |
|kana_last             |  string       | null:false   |
| birthday             |   date        |              |
|----------------------|---------------|--------------|

### Association
- has_many :items
- has_many :purchases

## items

|Column           |Type           |Options           |
|-----------------|---------------|------------------|
| title           | string        | null:false       |
| explanation     | text          | null:false       |
| category_id     | integer       | null:false       |
| status_id       | integer       | null:false       |
| delivery_fee_id | integer       | null:false       |
| delivery_day_id | integer       | null:false       |
| price           | integer       | null:false       |
| user            | references    | foreign_key:true | 
|-----------------|---------------|------------------| 

### Association
- belongs_to :user
- has_one    :purchases 

## purchases

 |Column      |Type           |Options      |
|------------|---------------|--------------|
| user       | references    | foreign_key  |
| item       | references    | foreign_key  | 
|------------|---------------|--------------|

### Association
- belongs_to   :user
- belongs_to   :item
- has_one   :street

## streets

|Column           | Type           |Options           |
|-----------------|---------------|-------------------|
| postal_code     | string        | null:false        |
| prefecture_id   | integer       | null:false        |
| municipality    | string        | null:false        |
| address         | string        | null:false        |
| building        | string        | null:false        |
| tell            | string        | unique null:false |
|-----------------|---------------|-------------------|

### Association
- belongs_to  :purchases