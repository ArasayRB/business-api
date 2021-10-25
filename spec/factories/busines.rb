FactoryBot.define do
  factory :busine do
    name { Faker::Lorem.word }
    owner { Faker::Name.name }
    address {Faker::Address.full_address}
    description {Faker::Lorem.paragraph}
    mercantil_code { Faker::Code.nric }
  end
end
