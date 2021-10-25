FactoryBot.define do
  factory :service do
    title { Faker::Lorem.sentence }
    aproximate_price { Faker::Number.decimal(l_digits: 2)}
    description {Faker::Lorem.paragraph}
    top_people {Faker::Number.between(from: 1, to: 10)}
    min_people {Faker::Number.between(from: 1, to: 10)}
    busine_id nil
  end
end
