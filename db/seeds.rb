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

20.times do
  app_name = Faker::App.name
  Project.create(
    slug: app_name.downcase.split(" ").join("_"),
    title: app_name,
    description: Faker::SiliconValley.motto,
    image: Faker::Avatar.image,
    github_url: Faker::Internet.url,
    demo_url: Faker::Internet.url,
    views: Faker::Number.between(105,987),
    user_id: Faker::Number.between(1,10)
  )
end

20.times do
  Comment.create(
    content: Faker::Lorem.paragraph,
    user_id: Faker::Number.between(1,10),
    project_id: Faker::Number.between(1,20)
  )
end

20.times do
  Vote.create(
    user_id: Faker::Number.between(1,10),
    project_id: Faker::Number.between(1,20)
  )
end


Tag.create(name: "Finance")
Tag.create(name: "Events")
Tag.create(name: "Entertainment")
Tag.create(name: "Education")
Tag.create(name: "Dating")
Tag.create(name: "Business")
Tag.create(name: "Lifestyle")
Tag.create(name: "Photography")
Tag.create(name: "Travel")
Tag.create(name: "Shopping")
Tag.create(name: "Sports")
Tag.create(name: "Games")
Tag.create(name: "Weather")
Tag.create(name: "Maps & Nav")
Tag.create(name: "Books")
Tag.create(name: "Music")
Tag.create(name: "Medical")
Tag.create(name: "Beauty")
Tag.create(name: "Communication")
Tag.create(name: "Art & Design")
Tag.create(name: "Productivity")
Tag.create(name: "Tools")

30.times do
  ProjectTag.create(
    tag_id: Faker::Number.between(1,21),
    project_id: Faker::Number.between(1,20)
  )
end
  



