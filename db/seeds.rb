# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# purge all attached picture
Dress.all.each { |dress| dress.picture.purge }

# truncate all tables and reset the identity sequence
%w[users categories dresses transactions].each do |table|
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} RESTART IDENTITY CASCADE;")
end

# Clean the /storage/...(where image will be stored locally if we don't use aws)
Dir.glob(Rails.root.join('storage', '**', '*').to_s).sort_by(&:length).reverse.each do |x|
    if File.directory?(x) && Dir.empty?(x)
        Dir.rmdir(x)
    end
end

#Create users
6.times do |i|
    User.create(
        username: Faker::Games::Pokemon.name,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.phone_number_with_country_code,
        address: Faker::Address.full_address,
        password: "password",
        password_confirmation: "password"
    )
    puts "created user #{i + 1 }"
end

# Create categories
categories = [
    "A-line",
    "Ball-Gown",
    "Trumpet", 
    "Mermaid", 
    "Sheath", 
    "Jumpsuit",
    "Tea-Length",
    "Others"
]

if Category.count == 0  
    categories.each do |category| 
        Category.create(name: category)
        puts "created #{category} category"
    end
end 

#Create dress samples
prices = [111.11, 2222.22, 3333.33, 4444.44, 55.55, 666.66, 7.777, 8888.88, 9999.99, 4324.34, 1323.32, 5436.87]
if Dress.count == 0
    prices.each_with_index do |(price), index|
        dress = Dress.create(
            name: Faker::Movie.title,
            color: ["pure white", "ivory", "off-white", "cream", "champagne", "nude", "mocha", "peach", "blush", "lavender", "gold", "mink", "blue","red", "green"].sample,
            size: rand(6..14).to_s,
            description: Faker::Quote.famous_last_words,
            price: price,
            price_in_cents: price*100,
            category_id: rand(1..8),
            user_id: rand(1..5)
        )
        dress.picture.attach(io: File.open(Rails.root / 'docs' / 'dress_seeds' / "dress_#{index + 1}.jpg"), filename:"dress_#{index + 1}.jpg")
        puts "created dress number #{index + 1 }, price #{dress.price}, price in cents #{dress.price_in_cents}"
    end 
end 
