# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Seeding process has begun...'
startTime = Time.now

puts 'Updating Articles...'
ArticleApi.get_articles

puts 'Updating Videos...'
VideoApi.get_videos

endTime = Time.now
puts "Seeding has completed in #{endTime-startTime}ms"
