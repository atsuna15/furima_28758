FactoryBot.define do
  factory :customer_address do
    postal_code     {'123-4567'}
    region_id       { Faker::Number.between(from: 2, to: 48) }
    city            { Faker::Address.city}
    number          { Faker::Address.street_address}
    building_name   { Faker::Address.building_number}
    phone_number    { '12345678910' }
    token           { 'jjjjjjfkfnfde'}
  end
end
