require 'rails_helper'

describe 'A POST request to /api/v1/foods' do
  describe 'with proper data' do
    scenario 'should create the food' do
      data = { food: { name: 'Fish', calories: 20 } }

      post '/api/v1/foods', params: data

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to eq(data[:food][:name])
      expect(json[:calories]).to be(data[:food][:calories])
    end
  end

  describe 'without proper data' do
    scenario 'should return a 400 status code' do
      data = { food: { name: 'Fish' } }

      post '/api/v1/foods', params: data

      expect(response.status).to be(400)
    end
  end
end
