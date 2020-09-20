FactoryBot.define do
  factory :order_shipping_address do
    token            {'tok_c763cad599e943ff879a673a9fa1'}
    postal_code      { '123-4567' }
    shipping_from_id { 1 }
    city             { '大阪市淀川区'}
    street_address   { '東三国1−1-2' }
    phone_number     { 061234567 }
    user_id          { 1 }
    item_id          { 1 }
  end
end
