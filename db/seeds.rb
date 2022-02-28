# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
book1 = Book.create!(
    title: 'El Coronel no tiene quien le escriba',
    author: 'Gabriel Garcia Marquez',
    image: 'https://images.unsplash.com/photo-1589998059171-988d887df646?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8b3BlbiUyMGJvb2t8ZW58MHx8MHx8&w=1000&q=80'
)

user = User.create!(username: 'Matumba Ngambi')
user2 = User.create!(username: 'mrskenss382')
user3 = User.create!(username: '_soofy32')

reservation1 = user.reservations.create!(
    city: 'Lagos', 
    reservation_date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"),
    book: book1
)
reservation2 = user.reservations.create!(
    city: 'Olso', 
    reservation_date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"),
    book: book1
)