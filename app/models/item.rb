class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purachase
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_day

   validates :title, :explanation, :image, :category_id, :status_id, :prefecture_id, :delivery_fee_id, :delivery_day_id, presence: true
   validates :category_id, :status_id, :prefecture_id, :delivery_fee_id, :delivery_day_id, numericality: { other_than: 0 }
   validates :price, numericality:{ only_integer: true, greater_than: 300, less_than:9999999 } 
end