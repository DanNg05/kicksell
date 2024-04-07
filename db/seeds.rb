# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(first_name: "Dan", last_name: "Nguyen", password: "123456", email: "dan.ngchem@gmail.com")
User.create(first_name: "Solo", last_name: "Tohi", password: "123456", email: "solotohi@gmail.com")
User.create(first_name: "Doris", last_name: "Xu", password: "123456", email: "dorisxjt@gmail.com")

Shoe.create(name: "Louis Vuitton Trainers", description: "Red color mint condition", size: "12", price: "30", category: "Luxury", user_id: 2)
Shoe.create(name: "Vans Old Skool 36", description: "Off White color", size: "7", price: "30", category: "Casual", user_id: 1)
Shoe.create(name: "Saint Laurent Sneakers", description: "Off White color", size: "7", price: "50", category: "Luxury", user_id: 1)
Shoe.create(name: "New Balance 550", description: "Green White color", size: "12", price: "40", category: "Casual", user_id: 2)
