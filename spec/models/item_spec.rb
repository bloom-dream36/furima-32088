require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
   @item = FactoryBot.build(:item)
  end

 describe 'itemの保存'do
  context "itemが保存できる場合" do
    it "画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、、配送元の地域、発送日数、価格があれば保存できる" do
      expect(@item).to be_valid
    end
  end
 
  context "itemが保存できない時" do
    it "画像がないと保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名がないと保存できない" do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "商品の説明がないと保存できない" do
      @item.explanation  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "カテゴリーがないと保存できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "カテゴリーidが1以下だと保存できない" do
       @item.category_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it "商品の状態がないと保存できない" do
       @item.status_id = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "商品の状態のidが1以下だと保存できない" do
       @item.status_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include("Status must be other than 0")
    end
    it "配送料の負担がないと保存できない" do
       @item.delivery_fee_id = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end
    it "配送料の負担が1以下だと保存できない" do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 0")
    end
    it "配送元の地域がないと保存できない" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "配送元の地域idが1以下だと保存できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it "発送日数がないと保存できない" do
      @item.delivery_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end
    it "配送日数idが1以下だと保存できない" do
      @item.delivery_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 0")
    end
    it "価格がないと保存できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "価格は全角数字の場合登録できない" do
      @item.price = '４００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "価格は300円より上じゃないと保存できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end
    it "9999999円より下じゃないと保存できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
    it "価格は半角英数字混合だと保存できない" do
      @item.price = "aab2938"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "価格は半角英字では保存できない" do
      @item.price = "aaaaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "ユーザーが紐付いてないと保存できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
 end
end
