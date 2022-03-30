FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    first_name      { japanese_user.first.kanji }
    first_name_kana { japanese_user.first.katakana }
    last_name       { japanese_user.last.kanji }
    last_name_kana  { japanese_user.last.katakana }
    email           { Faker::Internet.free_email }
    password        { Faker::Internet.password }
    password_confirmation { password }
    nickname        { Faker::Name.initials(number: 2) }
    birthday        { Faker::Date.birthday(min_age: 5, max_age: 92) }
  end
end
