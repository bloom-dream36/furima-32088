FactoryBot.define do
  factory :user do
    nickname         { Faker::Name.initials(number: 2) }
    email            { Faker::Internet.free_email }
    password         { Faker::Internet.password }
    password_confirmation { password }
    first_name          { '山田' }
    last_name           { '太郎' }
    kana_first          { 'ヤマダ' }
    kana_last           { 'タロウ' }
    birthday            { Faker::Date.birthday(min_age: 18, max_age: 80) }
  end
end
