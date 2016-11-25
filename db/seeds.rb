# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.delete_all
User.delete_all


# creating Users
user1 = User.create({first_name: "Miriam", last_name: "Tocino", company: "Codaisseur", email: "miriam@codaisseur.com", newsletter: false})
user2 = User.create({first_name: "Wouter", last_name: "de Vos", company: "Codaisseur", email: "wouter@codaisseur.com", newsletter: false})
user3 = User.create({first_name: "Adriana", last_name: "Matsufuji", company: "Burger King", email: "adriana@burger.king", newsletter: false})
user4 = User.create({first_name: "Jon", last_name: "Snow", company: "Nightwatch", email: "jon@snow.com", newsletter: false})
user5 = User.create({first_name: "Sebastiaan", last_name: "Popper", company: "SebastiaanCo", email: "sebastiaan@sebastiaan.com", newsletter: false})
user7 = User.create({first_name: "Giulio", last_name: "Gallerini", company: "Codaisseur", email: "giulio.gallerini.work@hotmail.com", newsletter: false})
