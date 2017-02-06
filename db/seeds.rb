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
    points: 150,
    current_city: "San Francisco"
  },
  {
    first_name: "admin2",
    last_name: "admin2",
    email: "admin2@admin2",
    username: "admin2",
    password:"123",
    points: 350,
    current_city: "San Francisco"
  },
  {
    first_name: "Adam",
    last_name: "Smith",
    email: "as@example.com",
    username: "asmith",
    password:"123",
    points: 45,
    current_city: "San Francisco"
  },
  {
    first_name: "Glenn",
    last_name: "Rhee",
    email: "gr@example.com",
    username: "grhee",
    password:"123",
    points: 370,
    current_city: "Woodbury",
  },
  {
    first_name: "Lady",
    last_name: "Gaga",
    email: "lg@example.com",
    username: "lgaga",
    password:"123",
    points: 450,
    current_city: "New York",
  },
  {
    first_name: "Ryan",
    last_name: "Reynolds",
    email: "rr@example.com",
    username: "rreynolds",
    password:"123",
    points: 900,
    current_city: "New York",
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
  },
  {
    name:"San Francisco",
    description: " A crimson bridge, cable cars, a sparkling bay, and streets lined with elegant Victorian homes—San Francisco is undeniably one of the world’s great cities. Located along the Northern California at the state’s distinctive bend in the coast, the region has an alluring magic that stretches beyond the bay to diverse cities with nightlife and trend-setting cuisine.",
    photo: "san_fran.jpg"

  }
]
post_data = []

3.times do
  post_data << {
    title: FFaker::Lorem.phrase,
    message: FFaker::Lorem.phrase
  }
end

City.friendly.create(city_data)
User.friendly.create(user_data)
Post.create(post_data)

firstuser = User.first
seconduser = User.second
thirduser = User.last
posts = Post.all

City.first.posts << posts[0]
firstuser.posts << posts[0]
City.second.posts << posts[1]
firstuser.posts << posts[1]
City.last.posts << posts[2]
thirduser.posts << posts[2]
