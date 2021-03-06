# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"
 
users_csv = CSV.readlines("db/table/users.csv")
users_csv.shift
users_csv.each do |row|
  Indoor.create(:email => row[1], :image_url => row[2], :address => row[3], :access => row[4], :tele => row[5], :open_hour => row[6], :price => row[7], :rental => row[8], :parking => row[9], :lesson => row[10], :kid => row[11], :homepage => row[12], :holiday => row[15], :prefecture => row[16])
end