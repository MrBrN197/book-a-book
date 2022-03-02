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

# {
#     "id": 4,
#     "title": "a song of ice and fire",
#     "author": "George R.R Martin",
#     "image": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1376738412l/18337259.jpg",
#     "created_at": "2022-03-01T07:39:50.550Z",
#     "updated_at": "2022-03-01T07:39:50.550Z"
# },
# {
#     "id": 5,
#     "title": "mockingjay",
#     "author": "Suzanne Collins",
#     "image": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1586722918l/7260188._SY475_.jpg",
#     "created_at": "2022-03-01T07:41:45.076Z",
#     "updated_at": "2022-03-01T07:41:45.076Z"
# },
# {
#     "id": 6,
#     "title": "the fault in our stars",
#     "author": "John Green",
#     "image": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1632632557l/11870085.jpg",
#     "created_at": "2022-03-01T07:51:37.708Z",
#     "updated_at": "2022-03-01T07:51:37.708Z"
# },
# {
#     "id": 7,
#     "title": "Olivia and the Fairy Princesses",
#     "author": "Ian Falconer",
#     "image": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1340327711l/13546400.jpg",
#     "created_at": "2022-03-01T07:52:59.412Z",
#     "updated_at": "2022-03-01T07:52:59.412Z"
# },
# {
#     "id": 8,
#     "title": "The Last Thing He Told Me",
#     "author": "Laura Dave",
#     "image": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1603034599l/54981009.jpg",
#     "created_at": "2022-03-01T07:55:23.010Z",
#     "updated_at": "2022-03-01T07:55:23.010Z"
# },
# {
#     "id": 9,
#     "title": "Malibu Rising",
#     "author": "Taylor Jenkins",
#     "image": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1618293107l/55404546.jpg",
#     "created_at": "2022-03-01T07:56:09.861Z",
#     "updated_at": "2022-03-01T07:56:09.861Z"
# },
# {
#     "id": 10,
#     "title": "People We Meet on Vacation",
#     "author": "Emily Henry",
#     "image": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1618913179l/54985743.jpg",
#     "created_at": "2022-03-01T07:56:31.410Z",
#     "updated_at": "2022-03-01T07:56:31.410Z"
# },
# {
#     "id": 11,
#     "title": "The Hill We Climb: An Inaugural Poem for the Country",
#     "author": "Amanda Gorman",
#     "image": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1612178266l/56914101.jpg",
#     "created_at": "2022-03-01T08:00:53.052Z",
#     "updated_at": "2022-03-01T08:00:53.052Z"
# },
# {
#     "id": 12,
#     "title": "Black Girl, Call Home",
#     "author": "Jasmine Mans",
#     "image": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1605310476l/54359466.jpg",
#     "created_at": "2022-03-01T08:04:02.753Z",
#     "updated_at": "2022-03-01T08:04:02.753Z"
# }