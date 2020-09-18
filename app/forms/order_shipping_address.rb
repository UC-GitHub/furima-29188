class OrderShippingAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_from_id, :city, :street_address, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input Half-width numbers."}
    validates :city 
    validates :street_address
    validates :phone_number, length: { maximum: 11 } 
  end
  validates :shipping_from_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, shipping_from_id: shipping_from_id, city: city, street_address: street_address, building: building, phone_number: phone_number, order_id: order.id)
  end
end