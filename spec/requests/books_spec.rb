require 'rails_helper'

RSpec.describe 'Reservations requests', type: :request do
  let(:json) { JSON.parse(response.body) }

  before :each do
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
  end

  let(:index_request) { get api_books_url, as: :json }
  let(:show_request) { get api_book_url(@book), as: :json }
  let(:create_request) do
    post api_books_url,
        params: { 
          title: 'The Punisher',
          author: 'Stan Lee',
          image: 'https://images.unsplash.com/photo-1589998059171-988d887df646?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8b3BlbiUyMGJvb2t8ZW58MHx8MHx8&w=1000&q=80',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
            Pellentesque blandit imperdiet quam, nec mattis purus semper eget. Aliquam vel varius ipsum.',
          price: 30.5,
          rating: 5,
          genre: 'Action'
        },
         as: :json
  end
  let(:delete_request) { delete api_book_url(@book), as: :json }


  describe 'api/books#index' do
    it 'should return a successful response' do
      index_request
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'should show information about all books' do
      index_request
      expect(json['data'].size).to eq(1)
      expect(json['data'][0]['title']).to eq('The Lion and Jewel')
      expect(json['data'][0]['genre']).to eq('Drama')
      expect(json['data'][0]['price']).to eq('25.5')
    end
  end

  describe 'api/books#show' do
    it 'should return a successful response' do
      show_request
      expect(response).to have_http_status(200)
      expect(response).to be_successful
    end

    it 'should show information about a single book' do
      show_request
      expect(json['data']['author']).to eq('Wole Soyinka')
      expect(json['data']['rating']).to eql('5.0')
    end
  end

  describe 'api/books#create' do
    it 'should return a created response' do
      create_request
      expect(response).to have_http_status(201)
    end

    it 'should show information about the book created' do
      expect { create_request }.to change { Book.count }.from(1).to(2)
      expect(json['data']['title']).to eq('The Punisher')
      expect(json['data']['author']).to eq('Stan Lee')
    end
  end

  describe 'api/books#delete' do
    it 'should return a successful response' do
      delete_request
      expect(response).to have_http_status(200)
    end

    it 'should show a message when response is successful' do
      delete_request
      expect(json['message']).to eq('Book successfully deleted')
    end

    it 'should show information about the book deleted' do
      expect { delete_request }.to change { Book.count }.from(1).to(0)
      expect(json['data']['price']).to eq('25.5')
      expect(json['data']['genre']).to eq('Drama')
      expect(json['data']['price']).to eq('25.5')
    end
  end
end