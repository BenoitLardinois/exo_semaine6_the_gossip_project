require 'faker'
require 'table_print'
require 'bcrypt'

#RESET ALL THE DB
User.destroy_all
Comment.destroy_all
Gossip.destroy_all
City.destroy_all

#Creation of 10 cities
10.times do |index|
  c = City.new
  c.id = index + 1
  c.name = Faker::Address.city
  c.zip_code = Faker::Address.zip
  c.save
end
puts "10 villes ont été créées!"
puts tp City.all

#Creation of 10 users
10.times do |index|
  u = User.new
  u.id = index + 1
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = Faker::Internet.email
  u.description = Faker::Lorem.paragraph
  u.age = Faker::Number.between(from: 15, to: 70)
  u.password = "foobar"
  u.password_confirmation = "foobar"
  u.city = City.all.sample
  u.save
end
puts "10 utilisateurs ont été créés!"
puts tp User.all

#Creation of 20 gossip
20.times do |index|
  g = Gossip.new
  g.id = index + 1
  g.user = User.all.sample
  g.title = Faker::DcComics.title
  g.content = Faker::Lorem.paragraph
  g.save
end
puts "20 potins ont été créés!"
puts tp Gossip.all


#Creation of 20 comment
20.times do |index|
  co = Comment.new
  co.id = index + 1
  co.user = User.all.sample
  co.gossip = Gossip.all.sample
  co.content = Faker::Lorem.paragraph
  co.save
end
puts "20 commentaires ont été créés!"
puts tp Comment.all

# On crée un utilisateur "anonymous"
  User.create(
    id: User.all.length + 1,
    first_name: "anonymous",
    last_name: "unknown",
    age: 30,
    email: Faker::Internet.email,
    password: "foobar",
    password_confirmation: "foobar",
    city: City.all.sample
  )

puts tp User.all

