usernames = ["alice", "bob", "carol"]

usernames.each do |username|
  user = User.create
  user.username = username
  user.email = "#{username}@example.com"
  user.password = "12341234"
  user.first_name = username.capitalize
  user.last_name = "Smith"
  user.zip = rand(10000..99999)
  user.activity_level = rand(1..5)
  user.weight_starting_lbs = rand(75..300)
  user.height_inches = rand(60..80)
  user.dob = Date.new(1984,1,20)
  user.gender = ["Male", "Female"].sample
  user.save
end

puts "There are now #{User.count} users in the database."

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
