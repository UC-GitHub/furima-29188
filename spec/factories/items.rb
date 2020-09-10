FactoryBot.define do
  factory :item do
    name              {Faker::Lorem.characters(number: 15)}
    description       {Faker::Lorem.characters(number: 50)}
    category_id       {Faker::Number.between(from: 2, to: 10)}
    status_id         {Faker::Number.between(from: 2, to: 6)}
    shipping_fee_id   {Faker::Number.between(from: 2, to: 3)}
    shipping_from_id  {Faker::Number.between(from: 1, to: 47)}
    shipping_date_id  {Faker::Number.between(from: 2, to: 4)}
    price             {Faker::Number.between(from: 300, to: 9999999)}
  end
end
