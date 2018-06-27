require 'rails_helper'

describe 'A GET request to a specfic /api/v1/foods/:id' do
  it 'should return that food only' do
    foods = create_list(:food, 3)

    get "/api/v1/foods/#{foods.first.id}"

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:id]).to       be(foods.first.id)
    expect(data[:name]).to     eq(foods.first.name)
    expect(data[:calories]).to be(foods.first.calories)
  end
end
