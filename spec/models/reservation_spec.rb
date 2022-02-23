require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject do
    user = User.new(username: 'Dalung')
    book = Book.new(
      title: 'Mind Prey',
      author: 'John Sandford',
      image: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1435027890l/37298.jpg'
    )
    Reservation.create!(
      city: 'Jos', 
      reservation_date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"),
      user: user,
      book: book
    )
  end

  describe 'Validations for Reservation Model' do
    it 'should be a valid reservation' do
      expect(subject).to be_valid
    end

    it 'should be invalid if city column is blank' do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid if city string is more than 250 characters' do
      subject.city = 'c' * 251
      expect(subject).to_not be_valid
    end

    it 'should be invalid if reservation_date is blank' do
      subject.reservation_date = ''
      expect(subject).to_not be_valid
    end

    it 'should be invalid if reservation_date is in wrong format' do
      subject.reservation_date = '09/14/2022 13:09:48'
      expect(subject).to_not be_valid
      subject.reservation_date = 14/4/2022
      expect(subject).to_not be_valid

    end
  end
end
