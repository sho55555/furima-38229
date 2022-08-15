class Shipping < ApplicationRecord
  validates :postal_code, presense: true
  validates :prefecture_id, presense: true
  validates :city, presense: true
  validates :addresses, presense: true
  validates :building, presense: true
  validates :phone_number, presense: true

  belongs_to :order
end
