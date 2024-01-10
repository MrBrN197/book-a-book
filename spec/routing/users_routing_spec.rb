require 'rails_helper'

RSpec.describe Api::UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/users').to route_to('api/users#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: 'api/users/1').to route_to('api/users#show', id: '1', format: :json)
    end
  end
end
