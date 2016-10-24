# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

super_admin = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: false, admin: true, superadmin: true})
admin1 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: false, admin: true, superadmin: false})
admin2 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: false, admin: true, superadmin: false})

user1 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: false, admin: false, superadmin: false})
user2 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: false, admin: false, superadmin: false})
user3 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: true, admin: false, superadmin: false})
user4 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: true, admin: false, superadmin: false})
user5 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: false, admin: false, superadmin: false})
