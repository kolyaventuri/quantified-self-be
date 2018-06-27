require 'rails_helper'

describe 'A PATCH request to a specific /api/v1/foods/:id' do
  scenario 'should update that foods information' do
    food = create(:food)

    new_data = { food: { name: 'Skippity Bop', calories: 80 } }

    patch "/api/v1/foods/#{food.id}", params: new_data

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:id]).to       be(food.id)
    expect(data[:name]).to     eq(new_data[:food][:name])
    expect(data[:calories]).to be(new_data[:food][:calories])

    get "/api/v1/foods/#{food.id}"

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:id]).to       be(food.id)
    expect(data[:name]).to     eq(new_data[:food][:name])
    expect(data[:calories]).to be(new_data[:food][:calories])
  end

  scenario 'should throw a 400 error if the food does not exist' do
    food = create(:food)

    new_data = { food: { name: 'Flibbity Dop', calories: 20 } }

    patch '/api/v1/foods/1000', params: new_data

    expect(response.status).to be(400)
  end
end
