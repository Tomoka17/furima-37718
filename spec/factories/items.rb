FactoryBot.define do
  factory :item do
    name        {Faker::Commerce.product_name}
    price       {Faker::Commerce.price(range:300..9999999)}
    description {Faker::Lorem.sentence}
    association :user
    category    {2}
    item_status {2}
    freight     {2}
    ship_from   {2}
    day_to_ship {2}
  end
end
