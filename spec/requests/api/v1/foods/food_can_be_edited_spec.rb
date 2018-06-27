require 'rails_helper'

describe 'A PATCH request to a specific /api/v1/foods/:id' do
  scenario 'should update that foods information' do
    food = create(:food)

    new_data = { food: { name: 'Skippity Bop', calories: 80 } }

    patch "/api/v1/foods/#{food.id}", params: new_data

    expect(response).to be_successful

    data = json.parse(response.body, symbolize_names: true)

    expect(data[:id]).to       be(food.id)
    expect(data[:name]).to     eq(new_data[:food][:name])
    expect(data[:calories]).to be(new_data[:food][:calories])

    get "/api/v1/foods/#{id}"

    data = json.parse(response.body, symbolize_names: true)

    expect(data[:id]).to       be(food.id)
    expect(data[:name]).to     eq(new_data[:food][:name])
    expect(data[:calories]).to be(new_data[:food][:calories])
  end
end
