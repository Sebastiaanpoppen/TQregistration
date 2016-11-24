# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.delete_all
User.delete_all

# creating email for Admins
emailA1 = "info@codaisseur.com"
# Creating Admins
admin1 = Admin.create( {email: emailA1, password: "codaisseur2016"} )

# creating Users
user1 = User.create({first_name: "Miriam", last_name: "Tocino", company: "Codaisseur", email: "miriam@codaisseur.com", newsletter: true})
user2 = User.create({first_name: "Wouter", last_name: "de Vos", company: "Codaisseur", email: "wouter@codaisseur.com", newsletter: true})
user3 = User.create({first_name: "Adriana", last_name: "Matsufuji", company: "Burger King", email: "adriana@burger.king", newsletter: false})
user4 = User.create({first_name: "Jon", last_name: "Snow", company: "Nightwatch", email: "jon@snow.com", newsletter: false})
user5 = User.create({first_name: "Sebastiaan", last_name: "Popper", company: "SebastiaanCo", email: "sebastiaan@sebastiaan.com", newsletter: false})
user6 = User.create({first_name: "Robert", last_name: "Roberto", company: "TQ", email: "robert@tq.co", newsletter: true})


# create bookings


Booking.create(admin: admin1, user: user3, checkin: 1.days.from_now.to_date)
Booking.create(admin: admin1, user: user1, checkin: Date.today)
Booking.create(admin: admin1, user: user3, checkin: Date.today)
Booking.create(admin: admin1, user: user3, checkin: 16.days.from_now.to_date)
Booking.create(admin: admin1, user: user4, checkin: 20.days.from_now.to_date)
Booking.create(admin: admin1, user: user2, checkin: 10.days.from_now.to_date )
Booking.create(admin: admin1, user: user3, checkin: 5.days.from_now.to_date)
Booking.create(admin: admin1, user: user1, checkin: 2.days.from_now.to_date)
Booking.create(admin: admin1, user: user3, checkin: 12.days.from_now.to_date)
Booking.create(admin: admin1, user: user3, checkin: 7.days.from_now.to_date)
Booking.create(admin: admin1, user: user4, checkin: 30.days.from_now.to_date)
Booking.create(admin: admin1, user: user2, checkin: 60.days.from_now.to_date )
Booking.create(admin: admin1, user: user3, checkin: 80.days.from_now.to_date)
Booking.create(admin: admin1, user: user1, checkin: 160.days.from_now.to_date)
Booking.create(admin: admin1, user: user3, checkin: 200.days.from_now.to_date)
Booking.create(admin: admin1, user: user3, checkin: 450.days.from_now.to_date)
Booking.create(admin: admin1, user: user4, checkin: 400.days.from_now.to_date)
Booking.create(admin: admin1, user: user2, checkin: 366.days.from_now.to_date )
Booking.create(admin: admin1, user: user3, checkin: 420.days.from_now.to_date)
Booking.create(admin: admin1, user: user1, checkin: 500.days.from_now.to_date)
Booking.create(admin: admin1, user: user3, checkin: 600.days.from_now.to_date)
Booking.create(admin: admin1, user: user3, checkin: 570.days.from_now.to_date)
Booking.create(admin: admin1, user: user4, checkin: 430.days.from_now.to_date)
Booking.create(admin: admin1, user: user2, checkin: 700.days.from_now.to_date )
