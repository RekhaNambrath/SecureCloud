# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(id: 1, first_name: 'tpa',email: 'tpa@example.com',password_digest: '$2a$10$uXZn2J2qzvvENVJ1z/i7guddQtXxsOV2xfDHgL3YZCJSBfwWgoPtq',date_of_birth: DateTime.new(2016, 1, 1),gender: 'Female',tpa: true)