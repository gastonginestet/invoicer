# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.create!(
  email: "user@example.com",
  password: "password",
  password_confirmation: "password"
)

20.times do |i|
  Invoice.create!(
    number: "INV#{i + 1}",
    amount: rand(100..1000),
    description: "Invoice number #{i + 1}",
    user: user
  )
end
puts "Seed data created successfully!"
