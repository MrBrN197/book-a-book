# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create!(username: 'matumba')
user2 = User.create!(username: 'mrberry')
user3 = User.create!(username: 'soofy_32')

book1 = Book.create!(
    title: "A Song Of Ice and Fire",
    author: "George R.R Martin",
    image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1376738412l/18337259.jpg",
    description: 'Here is the first volume in George R. R. Martin’s magnificent cycle of novels that includes A Clash of Kings and A Storm of Swords. As a whole, this series comprises a genuine masterpiece of modern fantasy, bringing together the best the genre has to offer. Magic, mystery, intrigue, romance, and adventure fill these pages and transport us to a world unlike any we have ever experienced. Already hailed as a classic, George R. R. Martin’s stunning series is destined to stand as one of the great achievements of imaginative fiction.',
    rating: 4.44,
    price: 14.95,
    genre: 'Fantasy'
)
book2 = Book.create!(
    title: "Mockingjay",
    author: "Suzanne Collins",
    image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1586722918l/7260188._SY475_.jpg",
    description: "Katniss Everdeen, girl on fire, has survived, even though her home has been destroyed. Gale has escaped. Katniss's family is safe. Peeta has been captured by the Capitol. District 13 really does exist. There are rebels. There are new leaders. A revolution is unfolding.",
    rating: 4.06,
    price: 16.25,
    genre: 'Fiction'
)
book3 = Book.create!(
    title: "The Fault in our Stars",
    author: "John Green",
    image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1632632557l/11870085.jpg",
    description: "Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel's story is about to be completely rewritten.",
    rating: 4.17,
    price: 23.45,
    genre: 'Romance'
)
book4 = Book.create!(
    title: "Olivia and the Fairy Princesses",
    author: "Ian Falconer",
    image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1340327711l/13546400.jpg",
    description: "n this picture book starring the world’s most imaginative pig, Olivia embarks upon a quest for identity with very lofty goals—and being a princess is NOT one of them!",
    rating: 4.22,
    price: 5.65,
    genre: 'Childrens'
)
book5 = Book.create!(
    title: "The Last Thing He Told Me",
    author: "Laura Dave",
    image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1603034599l/54981009.jpg",
    description: 'We all have stories we never tell. Before Owen Michaels disappears, he manages to smuggle a note to his beloved wife of one year: Protect her.',
    rating: 3.93,
    price: 12.20,
    genre: 'Mystery'
)
book6 = Book.create!(
    title: "Malibu Rising",
    author: "Taylor Jenkins",
    image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1618293107l/55404546.jpg",
    description: 'Four famous siblings throw an epic party to celebrate the end of the summer. But over the course of twenty-four hours, their lives will change forever.',
    rating: 4.09,
    price: 18.95,
    genre: 'Fiction'
)
book7 = Book.create!(
    title: "People We Meet on Vacation",
    author: "Emily Henry",
    image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1618913179l/54985743.jpg",
    description: 'Poppy and Alex. Alex and Poppy. They have nothing in common. She’s a wild child; he wears khakis. She has insatiable wanderlust; he prefers to stay home with a book. And somehow, ever since a fateful car share home from college many years ago, they are the very best of friends. For most of the year they live far apart—she’s in New York City, and he’s in their small hometown—but every summer, for a decade, they have taken one glorious week of vacation together.',
    rating: 4.04,
    price: 14.35,
    genre: 'Romance'
)
book8 = Book.create!(
    title: "The Hill We Climb: An Inaugural Poem for the Country",
    author: "Amanda Gorman",
    image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1612178266l/56914101.jpg",
    description: "On January 20, 2021, Amanda Gorman became the sixth and youngest poet to deliver a poetry reading at a presidential inauguration. Taking the stage after the 46th president of the United States, Joe Biden, Gorman captivated the nation and brought hope to viewers around the globe. Her poem “The Hill We Climb: An Inaugural Poem for the Country” can now be cherished in this special gift edition. Including an enduring foreword by Oprah Winfrey, this keepsake celebrates the promise of America and affirms the power of poetry.",
    rating: 4.58,
    price: 24.95,
    genre: 'Poetry'
)
book9 = Book.create!(
    title: "Black Girl, Call Home",
    author: "Jasmine Mans",
    image: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1605310476l/54359466.jpg",
    description: "With echoes of Gwendolyn Brooks and Sonia Sanchez, Mans writes to call herself—and us—home. Each poem explores what it means to be a daughter of Newark, and America--and the painful, joyous path to adulthood as a young, queer Black woman.",
    rating: 4.45,
    price: 18.45,
    genre: 'Poetry'
)

reservation1 = user1.reservations.create!(
    city: 'Lagos', 
    reservation_date: DateTime.strptime("05/14/2022 14:30", "%m/%d/%Y %H:%M"),
    book: book1
)
reservation2 = user1.reservations.create!(
    city: 'Oslo', 
    reservation_date: DateTime.strptime("03/13/2022 08:00", "%m/%d/%Y %H:%M"),
    book: book2
)

reservation3 = user1.reservations.create!(
    city: 'Nairobi', 
    reservation_date: DateTime.strptime("10/10/2022 18:30", "%m/%d/%Y %H:%M"),
    book: book4
)

reservation4 = user1.reservations.create!(
    city: 'New York', 
    reservation_date: DateTime.strptime("07/07/2022 23:00", "%m/%d/%Y %H:%M"),
    book: book5
)

reservation5 = user1.reservations.create!(
    city: 'Kampala', 
    reservation_date: DateTime.strptime("04/01/2022 07:00", "%m/%d/%Y %H:%M"),
    book: book7
)

reservation6 = user1.reservations.create!(
    city: 'California', 
    reservation_date: DateTime.strptime("03/13/2022 09:00", "%m/%d/%Y %H:%M"),
    book: book9
)