require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do 
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep(1)
    @address_order = FactoryBot.build(:address_order, user_id: buyer.id, item_id: item.id)
  end
  
  describe '購入機能' do
   context'保存できる時' do
    it '配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号とトークンが必須であること' do
      expect(@address_order).to be_valid
    end
    it 'buildingが空でも保存できる' do
     @address_order.building = nil
     expect(@address_order).to be_valid
    end
   end

   context '保存がうまくいかない時' do
     it 'postal_codeが空だと保存できない' do
      @address_order.postal_code = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include ("Postal code can't be blank")
     end
     it 'postal_codeはハイフンがないと保存できない' do
      @address_order.postal_code = "1231234"
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include ("Postal code in invalid. Incluide hyphen(-)")
     end
     it 'prefectureが空だと保存できない' do
      @address_order.prefecture_id = 0
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include ("Prefecture can't be blank")
     end
     it 'cityが空だと保存できない' do
      @address_order.city = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include ("City can't be blank")
     end
     it 'house_numberが空だと保存できない' do
      @address_order.house_number = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include ("House number can't be blank")
     end
     it 'tellが空だと保存できない' do
      @address_order.tell = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include ("Tell can't be blank")
     end
     it 'tellは11桁以内でないと保存できない' do
      @address_order.tell = "090999999999"
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include ("Tell is out of setting")
     end
     it 'tellはハイフンがいらない' do
      @address_order.tell = "090-1234-1234"
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include ("Tell is out of setting")
     end
     it 'tellは半角数字のみ保存する' do
      @address_order.tell = "１２３４５６７８９１"
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Tell 半角数字で入力してください")
     end
     it 'トークンが空だと保存できない' do
      @address_order.token = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Token can't be blank")
     end
     it 'item_idが空だと保存できない' do
      @address_order.item_id = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Item can't be blank")
     end
     it 'user_idが空だと保存できない' do
      @address_order.user_id = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("User can't be blank")
     end
   end
  end
end