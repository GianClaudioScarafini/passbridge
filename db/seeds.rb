# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

p "create 10 users each user has 1 item"

10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.cell_phone,
    password: "123456"
  )

  user.save!
  item = Item.create(
    name: Faker::Commerce.product_name,
    location: Faker::Address.city,
    description: Faker::Lorem.paragraph,
    quantity: Faker::Number.number(digits: 2),
    price: Faker::Number.decimal(l_digits: 2),
    condition: "good",
    user: user,
    start_date: Faker::Date.between(from: 50.days.ago, to: Date.today),
    end_date: Faker::Date.between(from: Date.today, to: 50.days.from_now)
  )
  item.save!
end
