class AddressOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :tell, :user_id, :item_id, :token


  with_options presence: true do
    validates  :city, :house_number, :token, :item_id, :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "in invalid. Incluide hyphen(-)"}
    validates :tell, numericality: { only_integer: true,message: "半角数字で入力してください"} ,format: { with: /\A\d{10}$|\d{11}\z/, message: "is out of setting"}
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank"}
  



  def save

   order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, tell: tell, order_id: order.id )
  end
end
