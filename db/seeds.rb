# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
include Faker 

10.times do
  first = Faker::Name.unique.first_name
  last = Faker::Name.unique.last_name
  User.create(
    first_name: first,
    last_name: last,
    email: Faker::Internet.email(first),
    username: Faker::Internet.user_name(last),
    password: 'hi',
    phone_number: Faker::PhoneNumber.phone_number,
    bio: Faker::Lorem.paragraph,
    avatar: Faker::Avatar.image,
    github_username: Faker::Internet.unique.user_name,
    role: 'student',
    views: Faker::Number.between(10,1000)
  )
end