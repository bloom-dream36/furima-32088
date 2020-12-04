FactoryBot.define do
  factory :user do
    nickname         {Faker::Name.initials(number:2)}
    email            {Faker::Internet.free_email}
    password         {Faker::Internet.password(min_length:6)}
    password_confirmation { password }
    first_name          {Faker::Name.first_name}
    last_name           {Faker::Name.last_name}
    kana_first          {Faker::Name.first_name}
    kana_last           {Faker::Name.last_name}
    birthday            {Faker::Date.birthday(min_age:18,max_age:80)}
  end
end
