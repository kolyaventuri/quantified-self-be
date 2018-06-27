require 'rails_helper'

describe 'A DELETE request to a specific /api/v1/foods/:id' do
  scenario 'should delete that food and return a 204 status code' do
    foods = create_list(:food, 3)

    expect(Food.count).to be(3)

    id = foods.first.id
    delete "/api/v1/foods/#{id}"

    expect(response.status).to be(204)

    expect(Food.count).to be(2)

    get "/api/v1/foods/#{id}"

    expect(response.status).to be(404)
  end

  xscenario 'should return a 404 status code if the food does not exist' do

  end
end
