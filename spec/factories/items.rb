FactoryBot.define do
  factory :item do
    title               { 'タイトル' }
    explanation         { Faker::Lorem.sentence }
    category_id { 1 }
    status_id            { 1 }
    delivery_fee_id      { 1 }
    prefecture_id { 1 }
    delivery_day_id      { 1 }
    price                { 400 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
    association :user
  end
end
