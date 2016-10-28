# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.delete_all
User.delete_all
Admin.delete_all
# creating email for Admins
emailSA = Faker::Internet.email
emailA1 = "info@codaisseur.com"
emailA2 = "team@tq.com"
emailA3 = "giulio_wow@hotmail.it"
# Creating Admins
super_admin = Admin.create( {email: emailSA, password: "superadmin1234", super_admin: true} )
admin1 = Admin.create( {email: emailA1, password: "codaisseur2016"} )
admin2 = Admin.create( {email: emailA2, password: "tqregistration2016"} )
admin3 = Admin.create( {email: emailA3, password: "giuliogallerini1993"} )
# creating Users
user1 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: false})
user2 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: false})
user3 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: true})
user4 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: true})
user5 = User.create({first_name: Faker::Name.name, last_name: Faker::Name.last_name, company: Faker::Company.name, email: Faker::Internet.email, newsletter: false})

# create bookings


Booking.create(admin: admin2, user: user3, checkin: -365.days.from_now.to_date)
Booking.create(admin: admin2, user: user1, checkin: Date.today)
Booking.create(admin: admin3, user: user3, checkin: Date.today)
Booking.create(admin: admin1, user: user3, checkin: -400.days.from_now.to_date)
Booking.create(admin: admin2, user: user4, checkin: 20.days.from_now.to_date)
Booking.create(admin: admin1, user: user2, checkin: 70.days.from_now.to_date )
