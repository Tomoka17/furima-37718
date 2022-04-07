FactoryBot.define do
  factory :order_destination do
    address = Gimei.address

    postal_code    { "111-1111" }
    ship_from_id   { Faker::Number.between(from: 2, to: 48) }
    city           { address.city.kanji }
    address        { address.town.kanji + "1-1"}
    phone_number   { "09011111111" }
    building_name  { "スカイマンション505" }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
