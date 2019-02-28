require 'faker'
include Faker 
# load the gem
require 'net/http'
require 'json'
gif_url = "http://api.giphy.com/v1/gifs/search?q=fail&api_key=dc6zaTOxFJmzC&limit=50&rating=g"
gif_resp = Net::HTTP.get_response(URI.parse(gif_url))
gif_buffer = gif_resp.body
gif_result = JSON.parse(gif_buffer)
gif_urls = gif_result["data"].map {|data| data["images"]["fixed_height"]["url"]}
copy_gifs = gif_urls.map(&:dup)


user_url = "https://randomuser.me/api/?results=100"
user_resp = Net::HTTP.get_response(URI.parse(user_url))
user_buffer = user_resp.body
user_result = JSON.parse(user_buffer)
user_avatars = user_result["results"].map{|d| d["picture"]["large"]}
copy_avatars = user_avatars.map(&:dup)

20.times do
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
    avatar: copy_avatars.shift,
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
    image: copy_gifs.shift,
    github_url: Faker::Internet.url,
    demo_url: Faker::Internet.url,
    views: Faker::Number.between(105,987),
    user_id: Faker::Number.between(1,20)
  )
end

68.times do
  Comment.create(
    content: Faker::Lorem.paragraph,
    user_id: Faker::Number.between(1,10),
    project_id: Faker::Number.between(1,20)
  )
end

68.times do
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
  
6.times do
  ProjectTag.create(
    tag_id: 12,
    project_id: Faker::Number.between(1,20)
  )
end

6.times do
  ProjectTag.create(
    tag_id: 21,
    project_id: Faker::Number.between(1,20)
  )
end

6.times do
  ProjectTag.create(
    tag_id: 6,
    project_id: Faker::Number.between(1,20)
  )
end

6.times do
  ProjectTag.create(
    tag_id: 4,
    project_id: Faker::Number.between(1,20)
  )
end


