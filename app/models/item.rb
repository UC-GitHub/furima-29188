class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_from
  belongs_to_active_hash :shipping_date

  has_one :purchase
  belongs_to :user
  has_one_attached :image

  validates :name, :description, :category, :stauts, :shipping_fee, :shipping_from, :shipping_date, :price, presence: true
  validates :category_id, :status_id, :shipping_fee_id, :shipping_date_id, numericality: { other_than: 1 } 
  validates :shipping_from_id, numericality: { other_than: 0 }


end
