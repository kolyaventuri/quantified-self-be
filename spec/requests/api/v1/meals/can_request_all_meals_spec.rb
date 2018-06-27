require 'rails_helper'

describe 'When a GET request is made to /api/v1/meals' do
  it 'should return a JSON array of all meals' do
    meals = create_list(:meal, 3)

    get '/api/v1/meals'

    expect(response).to be_successful

    data = JSON.parse(response, symbolize_names: true)

    expect(data.length).to be(meals.length)

    expect(data.first.id).to be(data.first.id)
    expect(data.first.name).to eq(data.first.name)

    expect(data.last.id).to be(data.last.id)
    expect(data.last.name).to be(data.last.name)
  end
end
