FactoryBot.define do
  factory :item do
    name           {Faker::Commerce.product_name}
    price          {300}
    description    {Faker::Lorem.sentence}
    association :user
    category_id    { Faker::Number.between(from: 2, to: 11) }
    item_status_id { Faker::Number.between(from: 2, to: 7) }
    freight_id     { Faker::Number.between(from: 2, to: 3) }
    ship_from_id   { Faker::Number.between(from: 2, to: 48) }
    day_to_ship_id { Faker::Number.between(from: 2, to: 4) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'),filename: 'test.png')
  end
  end 
end
