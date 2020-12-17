FactoryBot.define do
  factory :address_order do
   postal_code     {'123-4567'}
   prefecture_id      { 1 }
   city             { '東京都' }  
   house_number     { '1-1'}
   building         { '東京ハイツ' }    
   tell             { '09012345671' }
   token            {"tok_abcdefghijk00000000000000000"}
   user_id          { 3 }
   item_id           { 2 }
  end
end
