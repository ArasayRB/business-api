# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# seed 50 records
50.times do
  busine = Busine.create(name: Faker::Lorem.word, owner: User.first.id, mercantil_code: Faker::Code.nric)
  busine.services.create(title: Faker::Lorem.word, aproximate_price: Faker::Number.decimal(l_digits: 2))
end
