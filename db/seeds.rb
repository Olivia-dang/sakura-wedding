# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

categories = [
    "A-line", 
    "Trumpet", 
    "Mermaid", 
    "Sheath", 
    "Jumpsuit"
]

if Category.count == 0  
    categories.each do |category| 
        Category.create(name: category)
        puts "created #{category} category"
    end
end 

if Dress.count == 0
    20.times do |i|
        Dress.create(
            name: Faker::Games::Pokemon.name,
            category_id: rand(0..4),
            color: ["pure white", "ivory", "off-white", "cream", "champagne", "nude", "mocha", "peach", "blush", "lavender", "gold", "mink", "blue","red", "green"].sample,
            size: rand(6..14).to_s,
            description: Faker::Quote.famous_last_words,
            price: rand(1.00..9999.95)
        )
        puts "created book number #{i + 1 }"
    end 
end 