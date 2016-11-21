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
emailSA = "robert@tq.co"
emailA1 = "info@codaisseur.com"
emailA2 = "team@tq.co"
emailA3 = "giulio_wow@hotmail.it"
# Creating Admins
super_admin = Admin.create( {email: emailSA, password: "superadmin1234", super_admin: true} )
admin1 = Admin.create( {email: emailA1, password: "codaisseur2016"} )
admin2 = Admin.create( {email: emailA2, password: "tqregistration2016"} )
admin3 = Admin.create( {email: emailA3, password: "giuliogallerini1993"} )
# creating Users
user1 = User.create({first_name: "Miriam", last_name: "Tocino", company: "Codaisseur", email: "miriam@codaisseur.com", newsletter: true})
user2 = User.create({first_name: "Wouter", last_name: "de Vos", company: "Codaisseur", email: "wouter@codaisseur.com", newsletter: true})
user3 = User.create({first_name: "Adriana", last_name: "Matsufuji", company: "Burger King", email: "adriana@burger.king", newsletter: false})
user4 = User.create({first_name: "Jon", last_name: "Snow", company: "Nightwatch", email: "jon@snow.com", newsletter: false})
user5 = User.create({first_name: "Sebastiaan", last_name: "Popper", company: "SebastiaanCo", email: "sebastiaan@sebastiaan.com", newsletter: false})
user6 = User.create({first_name: "Robert", last_name: "Roberto", company: "TQ", email: "robert@tq.co", newsletter: true})


# create bookings


Booking.create(admin: admin2, user: user3, checkin: 1.days.from_now.to_date)
Booking.create(admin: admin2, user: user1, checkin: Date.today)
Booking.create(admin: admin3, user: user3, checkin: Date.today)
Booking.create(admin: admin1, user: user3, checkin: 16.days.from_now.to_date)
Booking.create(admin: admin2, user: user4, checkin: 20.days.from_now.to_date)
Booking.create(admin: admin1, user: user2, checkin: 10.days.from_now.to_date )
