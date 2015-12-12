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

users = User.all

users.each do |user|
  rand(20).times do
    daily_record = DailyRecord.new
    daily_record.user_id = user.id
    daily_record.date = rand(2.months).seconds.ago
    daily_record.weight = rand(115..155)
    daily_record.save
  end
end

puts "There are now #{DailyRecord.count} daily records in the database."


meal_hashes = [
  { :description => "coffee" },
  { :description => "bagel" },
  { :description => "chili" },
  { :description => "soup" },
  { :description => "cake" },
  { :description => "pickles" },
  { :description => "salad" },
  { :description => "sandwich" },
  { :description => "noodles" },
  { :description => "thai" },
  { :description => "indian" }
]

daily_records = DailyRecord.all

daily_records.each do |daily_record|
  meal = Meal.new
  meal.daily_record_id = daily_record.id
  meal.position = 4
  meal.fullness_score = rand(1..10)
  meal.description = meal_hashes[rand(0..12)][:description]
  meal.save

  meal = Meal.new
  meal.daily_record_id = daily_record.id
  meal.position = 5
  meal.fullness_score = rand(1..10)
  meal.description = meal_hashes[rand(0..12)][:description]
  meal.save

  meal = Meal.new
  meal.daily_record_id = daily_record.id
  meal.position = 6
  meal.fullness_score = rand(1..10)
  meal.description = meal_hashes[rand(0..12)][:description]
  meal.save
end

puts "There are now #{Meal.count} meals in the database."


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
