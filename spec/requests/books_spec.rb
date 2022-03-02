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
end