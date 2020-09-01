FactoryBot.define do
  factory :item do
    name                {Faker::Lorem.word}
    content             {Faker::Lorem.sentence}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    day_id              {Faker::Number.between(from: 2, to: 4)}
    delivery_price_id   {Faker::Number.between(from: 2, to: 3)}
    region_id           {Faker::Number.between(from: 2, to: 48)}
    status_id           {Faker::Number.between(from: 2, to: 7)}
    price               {Faker::Number.between(from: 300, to:9999999)}
    association :user
  end
end
