class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status

  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { in: 300..9_999_999 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :sales_status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end
