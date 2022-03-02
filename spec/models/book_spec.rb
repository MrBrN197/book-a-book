require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject do
    book = Book.new(
      title: 'Mind Prey',
      author: 'John Sandford',
      image: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1435027890l/37298.jpg',
      decription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Pellentesque blandit imperdiet quam, nec mattis purus semper eget. Aliquam vel varius ipsum.',
      price: 20.5,
      rating: 3.5,
      genre: 'Action'
    )
  end
end