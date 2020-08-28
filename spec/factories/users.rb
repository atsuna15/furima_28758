FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    familiy_name {"小畑"}
    first_name {"あつし"}
    family_name_k {"コバタ"}
    first_name_k {"アツシ"}
    birth {Faker::Date.birthday}
  end
end
