# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = ['mary','jane','bob', 'dan'].each do |username|
    email = "#{username}@test.com"
    User.create!(email: email, password: password)
end

users = ['mary','jane','bob', 'dan'].each do |user|
    username = user
    first_name = user
    last_name = 'example'
    description = "#{username}'s the best person to transact with. You'll never want to deal with anyone else!"
end
