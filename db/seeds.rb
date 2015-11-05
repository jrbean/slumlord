# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tenant  = User.create(name: "Dwayne Johnson", api_token: "therock", email: "djohnson@example.com", building: 202, unit: 117, password: "password")

manager = User.create(name: "Stevie Wonder", email: "isntshelovely@example.com", api_token: "superstition", is_manager: true, password: "password")
