require 'rails_helper'

RSpec.describe 'Reservations requests', type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:user_attributes) { { username: 'Uhuru' } }

  before :each do
    @user = User.create! user_attributes
    @book = Book.create!(
      title: 'The Lion and Jewel',
      author: 'Wole Soyinka',
      image: 'https://images.unsplash.com/photo-1589998059171-988d887df646?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8b3BlbiUyMGJvb2t8ZW58MHx8MHx8&w=1000&q=80',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Pellentesque blandit imperdiet quam, nec mattis purus semper eget. Aliquam vel varius ipsum.',
      price: 25.5,
      rating: 5,
      genre: 'Drama'
    )
    @reservation1 = @user.reservations.create!(
      city: 'Lagos',
      reservation_date: DateTime.strptime('09/14/2009 8:00', '%m/%d/%Y %H:%M'),
      book: @book
    )
  end

  let(:index_request) { get api_user_reservations_url(@user), as: :json }
  let(:show_request) { get api_user_reservation_url(@user, @reservation1), as: :json }
  let(:create_request) do
    post api_user_reservations_url(@user),
         params: { city: 'Nairobi', reservation_date: '27/02/2022 18:00:53', book_id: @book.id },
         as: :json
  end
  let(:delete_request) { delete api_user_reservation_url(@user, @reservation1), as: :json }
  let(:update_request) do
    put api_user_reservation_url(@user, @reservation1),
        params: { city: 'Kampala', reservation_date: '29/03/2022 14:10:53', book_id: @book.id },
        as: :json
  end

  describe 'api/reservations#index' do
    it 'should return a successful response' do
      index_request
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'should show a message when response is successful' do
      index_request
      expect(json['message']).to eq('List of all reservations')
    end

    it 'should show information about all reservations' do
      index_request
      expect(json['data'].size).to eq(1)
      expect(json['data'][0]['city']).to eq('Lagos')
      expect(json['data'][0]['user_id']).to eq(@user.id)
    end
  end

  describe 'api/reservations#show' do
    it 'should return a successful response' do
      show_request
      expect(response).to have_http_status(200)
      expect(response).to be_successful
    end

    it 'should show a message when response is successful' do
      show_request
      expect(json['message']).to eq("Data for reservation #{@reservation1.id}")
    end

    it 'should show information about a single reservation' do
      show_request
      expect(json['data']['city']).to eq('Lagos')
      expect(json['data']['reservation_date']).to eq('2009-09-14T08:00:00.000Z')
    end
  end

  describe 'api/reservations#create' do
    it 'should return a successful response' do
      create_request
      expect(response).to have_http_status(200)
    end

    it 'should show a message when response is successful' do
      create_request
      expect(json['message']).to eq('Reservation Created')
    end

    it 'should show information about the reservation created' do
      expect { create_request }.to change { Reservation.count }.from(1).to(2)
      expect(json['data']['city']).to eq('Nairobi')
    end
  end

  describe 'api/reservations#delete' do
    it 'should return a deleted status response' do
      delete_request
      expect(response).to have_http_status(200)
    end

    it 'should show a message when response is successful' do
      delete_request
      expect(json['message']).to eq('Reservation Deleted')
    end

    it 'should show information about the reservation created' do
      expect { delete_request }.to change { Reservation.count }.from(1).to(0)
      expect(json['data']['city']).to eq('Lagos')
    end
  end

  describe 'api/reservations#update' do
    it 'should return an updated status response' do
      update_request
      expect(response).to have_http_status(200)
    end

    it 'should show a message when response is successful' do
      update_request
      expect(json['message']).to eq('Reservation Updated')
    end

    it 'should show information about the reservation updated' do
      update_request
      expect(json['data']['city']).to eq('Kampala')
      expect(json['data']['reservation_date']).to eq('2022-03-29T14:10:53.000Z')
    end
  end
end
