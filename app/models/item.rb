class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_from
  belongs_to_active_hash :shipping_date

  VALID_PRICE_REGEX = /\A[-]?[0-9]+(\.[0-9]+)?\z/
  
  validates :image, :name, :description, :category, :status, :shipping_fee, :shipping_from, :shipping_date, :price, presence: true
  validates :category_id, :status_id, :shipping_fee_id, :shipping_date_id, numericality: { other_than: 1, message: 'must be Selected' }
  validates :shipping_from_id, numericality: { other_than: 0, message: 'must be Selected' }
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range' }, format: { with: VALID_PRICE_REGEX, message: 'Half-width number' }

  has_one :purchase
  belongs_to :user
  has_one_attached :image

end
