require 'rails_helper'

describe 'When a GET request is made to /api/v1/meals' do
  it 'should return a JSON array of all meals' do
    meals = create_list(:meal, 3)

    get '/api/v1/meals'

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data.length).to be(meals.length)

    expect(data.first[:id]).to be(meals.first.id)
    expect(data.first[:name]).to eq(meals.first.name)

    expect(data.last[:id]).to be(meals.last.id)
    expect(data.last[:name]).to eq(meals.last.name)
  end
end
