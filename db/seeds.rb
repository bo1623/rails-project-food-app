# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.create(name: "Sheung Wan")
Location.create(name: "Wan Chai")
Location.create(name: "Central")
Location.create(name: "Admiralty")
Location.create(name: "Mid Levels")
Location.create(name: "Kennedy Town")
Location.create(name: "HKU")
Location.create(name: "Sai Wan")

Cuisine.create(name: "Chinese")
Cuisine.create(name: "Western")
Cuisine.create(name: "Coffee")
Cuisine.create(name: "Japanese")
Cuisine.create(name: "Thai")
Cuisine.create(name: "Korean")


User.create(username: "Jack", password: "password")
User.create(username: "HC Manager", password: "password", restaurant_manager: true)
User.create(username: "App Admin", password: "password", admin: true)
