class DeliveryDay < ActiveHash::Base
  self.data = [
    { id: 0, name: '---'},
    { id: 1, name: '1~2で配送'},
    { id: 2 , name: '2~3で配送'},
    { id: 3 , name: '4~7で配送'},
  ]

  include ActiveHash::Associations
  has_many :items
end
