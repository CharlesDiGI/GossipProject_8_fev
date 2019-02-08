# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
#création avec différents modules de faker des éléments de mes tables
#remise a zero des id dans toutes les tables
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end


#Create City
i = 0
20.times do
  if i > 9
    city = City.create!(name: Faker::Nation.capital_city, zip_code: "750#{i.to_i}") 
  else
    city = City.create!(name: Faker::Nation.capital_city, zip_code: "7500#{i.to_i}")
  end
  i += 1
end
i = 0

#Create Tags
5.times do
  tag = Tag.create!(title: Faker::Dessert.variety)
end

#Create User
10.times do
  user = User.create!(first_name: Faker::DragonBall.character, last_name: Faker::Name.last_name , description: Faker::HowIMetYourMother.quote, email: Faker::Internet.email, age: Faker::Number.between(18, 75), city_id: City.all.ids.sample, password: "tototata")
end
  #création d'un user anonyme
  # user = User.create!(first_name: "anonymous", last_name: "anonymous" , description: Faker::HowIMetYourMother.quote, email: Faker::Internet.email, age: Faker::Number.between(18, 75), city_id: City.all.ids.sample)

#Create Gossip
#checke u moins un tag par gossip
12.times do
  gossip = Gossip.create!(title: Faker::Lovecraft.word, content: Faker::ChuckNorris.fact, user_id: User.all.ids.sample)
end

#Create tags by potin
30.times do
  tag_by_gossip = TagByGossip.create!(gossip_id: Gossip.all.ids.sample, tag_id: Tag.all.ids.sample)
end

#Create Private Message
10.times do
  privatemessage = PrivateMessage.create!(content: Faker::GreekPhilosophers.quote, sender_id: User.all.ids.sample)
end

#create join table
10.times do
  multi_pm = MultiPm.create!(user_id: User.all.ids.sample, private_message_id: PrivateMessage.all.ids.sample)
end

10.times do
  Comment.create!(content: Faker::Fallout.quote, user_id: rand(User.first.id..User.last.id), commenteable_id: rand(Gossip.first.id..Gossip.last.id), commenteable_type: "Gossip")
  Comment.create!(content: Faker::Fallout.quote, user_id: rand(User.first.id..User.last.id), commenteable_id: rand(Comment.first.id..Comment.last.id), commenteable_type: "Comment")
end

15.times do
  Like.create!(likeable_id: rand(Gossip.first.id..Gossip.last.id), likeable_type: "Gossip", user_id: rand(User.first.id..User.last.id))
  Like.create!(likeable_id: rand(Comment.first.id..Comment.last.id), likeable_type: "Comment", user_id: rand(User.first.id..User.last.id))
end
