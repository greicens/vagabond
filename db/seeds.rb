# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all
City.destroy_all
User.destroy_all

user_data = [
  {
    first_name: "admin",
    last_name: "admin",
    email: "admin@admin",
    username: "admin",
    password:"123",
    points: 450,
    current_city: "San Francisco"
  },
  {
    first_name: "admin2",
    last_name: "admin2",
    email: "admin2@admin2",
    username: "admin2",
    password:"123",
    points: 400,
    current_city: "San Francisco"
  }
]
city_data = [{
    name:"London",
    description: "London is a leading global city, with strengths in the arts, commerce, education, entertainment, fa shion, finance, healthcare, media, profession al services, research and development, tourism and transport all contributing to its prominence. London has been described as a world cultural capital.",
    photo: "london.jpg"
  },
  {
    name:"Gibraltar",
    description: "A British colony centered around the heavily fortified Rock of Gibraltar, a strategically located peninsula on the north side of the Strait of Gibraltar, connecting the Mediterranean Sea and the Atlantic Ocean between Spain and northern Africa. Gibraltar was captured by Arabs in 711 and passed to the Spanish in 1462.",
    photo: "gibraltar.jpg"
  }
]
post_data = []


# 4.times do
#   user_data << {
#     first_name: FFaker::Name.first_name,
#     last_name: FFaker::Name.last_name,
#     email: FFaker::Internet.email,
#     username: FFaker::Internet.user_name,
#     password:"123",
#     points: Random.new.rand(15..500),
#     current_city: FFaker::Address.city
#   }
# end

# 3.times do
#   city_data << {
#     name: FFaker::Address.city,
#     description: FFaker::Lorem.phrase,
#     photo: "coming_soon.png"
#   }
# end

2.times do
  post_data << {
    title: FFaker::Lorem.phrase,
    message: FFaker::Lorem.phrase
  }
end

City.friendly.create(city_data)
User.friendly.create(user_data)
Post.create(post_data)

firstuser = User.first
seconduser = User.last
posts = Post.all

City.first.posts << posts[0]
firstuser.posts << posts[0]
City.last.posts << posts[1]
seconduser.posts << posts[1]
