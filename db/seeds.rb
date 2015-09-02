# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = [
  'Steph',
  'Chuo-Lee',
  'email@email.com',
  'blah1234'
]


User.create(firstname: user[0], lastname: user[1], email: user[2], password: user[3], password_confirmation: user[3])


