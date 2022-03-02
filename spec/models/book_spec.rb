require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject do
    book = Book.new(
      title: 'Mind Prey',
      author: 'John Sandford',
      image: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1435027890l/37298.jpg',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Pellentesque blandit imperdiet quam, nec mattis purus semper eget. Aliquam vel varius ipsum.',
      price: 20.5,
      rating: 3.5,
      genre: 'Action'
    )
  end

  describe 'Validations for Reservation Model' do
    it 'should be a valid book' do
      expect(subject).to be_valid
    end

    it 'should be invalid if title attribute is more than 100 characters' do
      subject.title = 'c' * 101
      expect(subject).to_not be_valid
    end

    it 'should be invalid if title column is blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid if author attribute is more than 100 characters' do
      subject.author = 'c' * 101
      expect(subject).to_not be_valid
    end

    it 'should be invalid if author column is blank' do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid if genre attribute is more than 100 characters' do
      subject.genre = 'c' * 101
      expect(subject).to_not be_valid
    end

    it 'should be invalid if genre column is blank' do
      subject.genre = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid if image column is blank' do
      subject.image = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid if description column is blank' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid if amount is negative or equal to zero' do
      subject.price = -2
      expect(subject).to_not be_valid
      subject.price = 0
      expect(subject).to_not be_valid
    end
  end
end