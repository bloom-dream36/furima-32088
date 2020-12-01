## Users

|Column      |Type           |Options       |
|------------|---------------|--------------|
| nick-name  |  string      | null:false   |
| email      |  string      | null:false   |
| password   |  string      | null:false   |
| first_name |  string      | null:false   |
| last_name  |  string      | null:false   |
|kana_first  |  string      | null:false   |
|kana_last   |  string      | null:false   |
| birthday   | integer      | null:false   |
|------------|--------------|--------------|

### Association
- has_many :items
- has_many :purchases

## items

|Column        |Type           |Options           |
|--------------|---------------|------------------|
| image        |               |                  |
| title        | text          | null:false       |
| explanation  | text          | null:false       |
| category     | text          | null:false       |
| status       | text          | null:false       |
| delivery_fee | string        | null:false       |
| delivery_day | date          | null:false       |
| price        | integer       | null:false       |
| user         | references    | foreign_key:true | 
|--------------|---------------|------------------| 

### Association
- belongs_to :user
- has_one    :purchases 

 |Column      |Type           |Options      |
|------------|---------------|--------------|
| user       | references    | foreign_key  |
| item       | references    | foreign_key  | 
| street     | references    | foreign_key  |
|------------|---------------|--------------|

### Association
- has_one   :item
- has_one   :street

## streets

|Column           | Type           |Options           |
|-----------------|---------------|-------------------|
| postal_code     | string        | null:false        |
| prefecture      | string        | null:false        |
| municipalities  | integer       | null:false        |
| address         | string        | null:false        |
| tell            | string        | unique null:false |
|-----------------|---------------|-------------------|

### Association
- has_one   :purchases