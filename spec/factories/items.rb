FactoryBot.define do
  factory :item do
    name        {Faker::Commerce.product_name}
    price       {Faker::Commerce.price(range:300..9999999)}
    description {Faker::Lorem.sentence}
    association :user
    association :category
    association :item_status
    association :freight
    association :ship_from
    association :day_to_ship
  end
end
